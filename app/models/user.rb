class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests

  validates :email, presence: true

  def user_tests_by_level(level)
    tests.where(level: level)
  end

  def user_passed_test(test)
    user_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
