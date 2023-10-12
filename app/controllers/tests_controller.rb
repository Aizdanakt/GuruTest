class TestsController < ApplicationController
  before_action :find_test, only: %i[new create show]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new test_params
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:question).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
