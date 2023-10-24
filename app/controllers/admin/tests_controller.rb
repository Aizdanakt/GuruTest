class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit; end

  def destroy
    @test.destroy
    redirect_to admin_tests_path(@test)
  end

  def create
    @test = current_user.created_tests.build(test_params)
    puts current_user.inspect
    if @test.save
      redirect_to admin_tests_path(@test)
    else
      puts current_user.inspect
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
