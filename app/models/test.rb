class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category_title)
    joins(:category).where(category: { title: category_title }).order(id: :desc).pluck(:title)
  end
end
