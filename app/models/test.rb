class Test < ApplicationRecord

  def self.get_sorted_tests_by_category(category_title)
    joins('join categories on categories.id = tests.category_id')
      .where(categories: { title: category_title })
      .order(id: :desc)
      .pluck(:title)
  end
end
