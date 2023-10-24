class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{current_user.name}!"
    stored_location_for(resource) || path_for_user_or_admin(current_user)
  end

  protected

  def path_for_user_or_admin(current_user)
    if current_user.type == 'Admin'
      admin_tests_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email])
  end

end
