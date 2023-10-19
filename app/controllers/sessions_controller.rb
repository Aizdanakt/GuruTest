class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name} Guru"
      redirect_to tests_path
    else
      flash[:error] = 'Invalid name or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out of your account'
    redirect_to login_path
  end
end
