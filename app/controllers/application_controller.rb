class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  # Is this secure?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :nickname, :education, :about, :occupation, :hometown, :interests, :past_homes, :past_travels, :future_travels, :travel_style, :location, :age, :currently_traveling, :avatar) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  # def configure_permitted_parameters
  # 	devise_parameter_sanitizer.for(:sign_up) << :username
  # end
end
