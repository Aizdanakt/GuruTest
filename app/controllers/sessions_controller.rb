class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name} Guru!"
      redirect_to cookies['redirect_url'] || root_path
      cookies.delete :redirect_url
    else
      flash[:error] = 'Invalid name or password!'
      redirect_to login_path
    end
  end

  def destroy
    user = User.find(session[:user_id])
    session[:user_id] = nil
    flash[:success] = "See you soon, #{user.name}!"
    redirect_to login_path
  end
end
