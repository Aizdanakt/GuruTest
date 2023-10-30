class GistsController < ApplicationController

  def create
    @user_passed_test = UserPassedTest.find(params[:user_passed_test_id])
    result = GistQuestionService.new(@user_passed_test.current_question).call
    gist_url = result[:html_url]
    if success?(result)
      Gist.create!({
                     body: @user_passed_test.current_question.body,
                     gist_url: gist_url,
                     user: current_user,
                     question: @user_passed_test.current_question
                   })
    end

    redirect_to user_passed_test_path(@user_passed_test), set_flash_options(result, gist_url)
  end

  private

  def set_flash_options(result, gist_url)
    if success?(result)
      { notice: t('.success', url: gist_url) }
    else
      { alert: t('.failure') }
    end
  end

  def success?(result)
    result[:id].present? && result[:html_url].present?
  end

end
