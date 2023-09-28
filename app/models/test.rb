class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :user_passed_tests
  has_many :users, through: :user_passed_tests

  def self.get_sorted_tests_by_category(category_title)
    joins('join categories on categories.id = tests.category_id')
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
