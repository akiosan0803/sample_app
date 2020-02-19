class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:nickname, :email, :password, :password_confirmation,:nickname, :avatar)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:nickname, :email, :password, :password_confirmation, :current_password, :avatar)
    end
  end
end