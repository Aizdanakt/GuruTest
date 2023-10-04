class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :users, through: :user_passed_tests

  scope :simple_tests, -> { where(level: 0..1) }
  scope :middle_tests, -> { where(level: 2..4) }
  scope :difficult_tests, -> { where(level: 5..Float::INFINITY) }

  scope :sorted_tests_by_category, ->(category_title) {
                                     joins(:category)
                                       .where(categories: { title: category_title })
                                       .order(id: :desc)
                                   }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.array_of_sorted_tests(category_title)
    sorted_tests_by_category(category_title).pluck(:title)
  end
end
