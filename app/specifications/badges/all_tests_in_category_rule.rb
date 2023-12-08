# frozen_string_literal: true

module Badges
  class AllTestsInCategoryRule < AbstractRuleSpecification
    def criteria_passed?
      user_tests_in_category = @user.tests.where(category: @test.category).uniq.count
      expected_tests_count = Test.where(category: @test.category).count

      (user_tests_in_category == expected_tests_count) &&
        (@option_data == @test.category.title) &&
        success?(@user_passed_test)
    end
  end
end
