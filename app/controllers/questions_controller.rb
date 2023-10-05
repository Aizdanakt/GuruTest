class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_questions_not_found

  def index
    render plain: { questions: Question.where(test_id: params[:test_id]) }
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new; end

  def create
    render plain: { question: params[:question] }
  end

  def delete; end

  private

  def find_question
    @question = Question.find_by!(id: params[:id], test_id: params[:test_id])
  end

  def rescue_with_questions_not_found
    render plain: 'Questions not found'
  end
end
