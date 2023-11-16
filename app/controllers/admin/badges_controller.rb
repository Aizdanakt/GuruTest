class Admin::BadgesController < Admin::BaseController
  before_action :all_rules, only: %i[new create]

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    puts badge_params.inspect
    if @badge.save
      redirect_to admin_tests_path, notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  private

  def all_rules
    @rules = Rule.all
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule_id, :category_id, :test_level_id, :test_id)
  end
end
