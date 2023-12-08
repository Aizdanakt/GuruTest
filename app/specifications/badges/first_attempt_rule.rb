# frozen_string_literal: true

module Badges
  class FirstAttemptRule < AbstractRuleSpecification
    def criteria_passed?
      user_passed_tests = @user.user_passed_tests.where(test: @test).count

      (user_passed_tests == 1) &&
        (@option_data == @test.title) &&
        success?(@user_passed_test)
    end
  end
end
