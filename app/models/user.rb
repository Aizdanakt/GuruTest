class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'
  has_many :user_passed_tests
  has_many :tests, through: :user_passed_tests

  def user_tests_by_level(level)
    Test.joins('join user_passed_tests on tests.id = user_passed_tests.test_id')
        .where(level: level, user_passed_tests: { user_id: id })
  end
end
