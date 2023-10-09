class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_questions_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
    render inline: '<%= @question.body %>'
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build question_params
    if @question.save
      render plain: 'success'
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render plain: 'success'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_questions_not_found
    render plain: 'Questions not found'
  end
end
