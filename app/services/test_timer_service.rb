class TestTimerService

  def initialize(user_passed_test)
    @user_passed_test = user_passed_test
    @time_limit = user_passed_test.test.time_limit
  end

  def call

  end

  def start_test_timer
    return if timer_started?

    @user_passed_test.start_time = Time.now
    @user_passed_test.save
  end

  private

  def timer_started?
    @user_passed_test.start_time.present?
  end

end
