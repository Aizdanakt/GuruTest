class AbstractRuleSpecification
  def initialize(user_passed_test, option_data)
    @user = user_passed_test.user
    @test = user_passed_test.test
    @user_passed_test = user_passed_test
    @option_data = option_data
  end

  def criteria_passed?
    raise NotImplementedError, "#{__method__} undefined for #{self.class}"
  end

  protected

  def success?(user_passed_test)
    user_passed_test.success?(user_passed_test.success_percentage(user_passed_test))
  end
end
