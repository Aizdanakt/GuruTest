class User::FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @admins = Admin.all
  end

  def create
    FeedbacksMailer.feedback(feedback_params, current_user).deliver_now
    redirect_to root_path
  end

  private

  def feedback_params
    params.permit(:feedback, :admin)
  end
end
