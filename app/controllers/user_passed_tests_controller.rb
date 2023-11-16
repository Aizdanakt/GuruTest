class UserPassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[show update result]

  def show; end

  def result; end

  def update
    @user_passed_test.accept!(params[:answer_ids])

    if @user_passed_test.completed?

      if successful_completion?(@user_passed_test)
        current_user.earn_achievements(@user_passed_test.test, @user_passed_test.test.category, current_user)
      end

      TestsMailer.completed_test(@user_passed_test).deliver_later
      redirect_to result_user_passed_test_path(@user_passed_test)
    else
      redirect_to user_passed_test_path(@user_passed_test)
    end
  end

  private

  def successful_completion?(user_passed_test)
    user_passed_test.correct_questions == user_passed_test.test.questions.count
  end

  def set_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
