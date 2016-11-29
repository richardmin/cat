class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    permitted_params = [:email, :password, :password_confirmation, :battlenetid]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) do
        |u| u.permit(permitted_params << :current_password)
      end
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) do
        |u| u.permit(permitted_params)
      end
    end
  end
end

class AuthenticationController < ApplicationController
  skip_before_filter :authenticate_user!

  def login
  end

  def register
  end
end
