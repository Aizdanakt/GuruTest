# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Привет, #{current_user.name}"
  end
end
