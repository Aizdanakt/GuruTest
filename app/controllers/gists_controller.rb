class GistsController < ApplicationController

  def create
    @user_passed_test = UserPassedTest.find(params[:user_passed_test_id])
    result = GistQuestionService.new(@user_passed_test.current_question).call
    gist_url = result[:html_url]

    if success?(result)
      create_gist(gist_url)
    else
      redirect_to user_passed_test_path(@user_passed_test), alert: t('.failure')
    end
  end

  private

  def create_gist(gist_url)
    Gist.transaction do
      Gist.create!({
                     body: @user_passed_test.current_question.body,
                     gist_url: gist_url,
                     user: current_user,
                     question: @user_passed_test.current_question
                   })
      redirect_to user_passed_test_path(@user_passed_test), notice: t('.success', url: gist_url)
    end
  end

  def success?(result)
    result[:id].present? && result[:html_url].present?
  end

end
