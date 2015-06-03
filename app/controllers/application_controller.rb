class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role, :name, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:role, :name, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end

  # def after_sign_in_path_for(resource)
  #   # home_index_path(current_user)
  #   products_path(current_user)
  # end

  # private
  #
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user

end
