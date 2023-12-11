class UserPassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[show update result]

  def show; end

  def result; end

  def update
    @user_passed_test.accept!(params[:answer_ids])

    if @user_passed_test.completed? || @user_passed_test.time_left <= 0

      BadgeService.new(@user_passed_test).call
      TestsMailer.completed_test(@user_passed_test).deliver_later

      redirect_to result_user_passed_test_path(@user_passed_test)
    else
      redirect_to user_passed_test_path(@user_passed_test)
    end
  end

  private

  def set_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
