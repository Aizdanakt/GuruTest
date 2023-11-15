class Admin::BadgesController < Admin::BaseController
  def new
    @badge = Badge.new
    @rules = Rule.all
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to badges_path, notice: 'Badge was successfully created.'
    else
      @rules = Rule.all
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image, :rule_id)
  end
end
