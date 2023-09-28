class User < ApplicationRecord

  def user_tests_by_level(level)
    Test.joins('join user_passed_tests on tests.id = user_passed_tests.test_id')
        .where(level: level, user_passed_tests: { user_id: id })
  end
end
