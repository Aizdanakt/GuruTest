class FeedbacksMailer < ApplicationMailer

  def feedback(feedback_params, current_user)
    @admin = Admin.find(feedback_params[:admin])
    @feedback = feedback_params[:feedback]
    @user = current_user
    mail to: @admin.email
  end
end
