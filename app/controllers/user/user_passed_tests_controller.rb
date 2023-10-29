class User::UserPassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @user_passed_test.accept!(params[:answer_ids])

    if @user_passed_test.completed?
      TestsMailer.completed_test(@user_passed_test).deliver_now
      redirect_to result_user_user_passed_test_path(@user_passed_test)
    else
      redirect_to user_user_passed_test_path(@user_passed_test)
    end
  end

  def gist
    result = GistQuestionService.new(@user_passed_test.current_question).call

    flash_options = if result[:id].present?

                      gist_url = result[:html_url]
                      save_gist(gist_url)

                      { notice: gist_url }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to user_user_passed_test_path(@user_passed_test), flash_options
  end

  private

  def save_gist(gist_url)
    gist = current_user.gists.build(
      body: @user_passed_test.current_question.body,
      gist_url: gist_url,
      question: @user_passed_test.current_question
    )

    gist.save!
  end

  def set_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
