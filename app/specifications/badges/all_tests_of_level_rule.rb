# frozen_string_literal: true

module Badges
  class AllTestsOfLevelRule < AbstractRuleSpecification
    def criteria_passed?
      unique_number_of_tests = @user.user_tests_by_level(@test.level).uniq.count
      tests_count_by_level = Test.where(level: @test.level).count

      (tests_count_by_level == unique_number_of_tests) &&
        (@option_data == @test.level) &&
        success?(@user_passed_test)
    end
  end
end
