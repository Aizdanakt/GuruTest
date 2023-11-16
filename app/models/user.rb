class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  # :confirmable

  EMAIL_FORMAT = %r{\A[a-zA-Z0-9.!\#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+\z}

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests
  has_many :gists, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :badges, through: :achievements

  validates :email, format: { with: EMAIL_FORMAT }
  validates :email, uniqueness: true
  validates :name, presence: true

  def user_tests_by_level(level)
    tests.where(level: level)
  end

  def user_passed_test(test)
    user_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def earn_achievements(test, category, user)
    badges = Badge.all

    badges.each do |badge|
      if badge.rule.criteria == 'all_tests_in_category' && all_tests_in_category_passed?(category)
        earn_category_achievement(badge, user, category)
      end

      if badge.rule.criteria == 'first_attempt' && first_attempt_passed?(test)
        earn_first_attempt_achievement(badge, user, test)
      end

      if badge.rule.criteria == 'all_tests_of_level' && all_tests_of_level_passed?(test)
        earn_level_achievement(badge, user, test)
      end
    end
  end

  private

  def all_tests_in_category_passed?(category)
    user_tests_in_category = tests.where(category: category).uniq

    user_tests_in_category.count == Test.where(category: category).count
  end

  def first_attempt_passed?(test)
    user_passed_tests.where(test: test).count == 1
  end

  def all_tests_of_level_passed?(test)
    Test.where(level: test.level).count == user_tests_by_level(test.level).uniq.count
  end

  def earn_category_achievement(badge, user, category)
    return unless badge&.category == category

    create_achievement(badge, user)
  end

  def earn_first_attempt_achievement(badge, user, test)
    return unless badge&.test == test

    create_achievement(badge, user)
  end

  def earn_level_achievement(badge, user, test)
    return unless badge&.test_level&.level == test.level

    create_achievement(badge, user)
  end

  def create_achievement(badge, user)
    Achievement.create!({
                          user: user,
                          badge: badge
                        })
  end
end
