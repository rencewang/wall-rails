class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :current_password, :password, :password_confirmation])
  end
end
