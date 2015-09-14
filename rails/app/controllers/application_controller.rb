require 'pp'
class ApplicationController < ActionController::Base
  before_filter :authenticate_user_from_token!
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :null_session

  # leave the line:
  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
    end

    def authenticate_user_from_token!
      authenticate_with_http_token do |token, options|
      pp options
      user_email = options[:user_email].presence
      user       = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end
end
