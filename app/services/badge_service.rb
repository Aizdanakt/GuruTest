class BadgeService
  RULES = {
    'all_tests_in_category' => Badges::AllTestsInCategoryRule,
    'first_attempt' => Badges::FirstAttemptRule,
    'all_tests_of_level' => Badges::AllTestsOfLevelRule
  }.freeze

  def initialize(user_passed_test)
    @user_passed_test = user_passed_test
  end

  def call
    Badge.find_each do |badge|
      rule_class = RULES[badge.rule.criteria]
      rule = rule_class.new(@user_passed_test, badge.option_data)

      create_achievement(badge) if rule.criteria_passed?
    end
  end

  private

  def create_achievement(badge)
    Achievement.create!({
                          user: @user_passed_test.user,
                          badge: badge
                        })
  end
end
