class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(:avatar, :address, :name, :user_type)
    devise_parameter_sanitizer.for(:sign_in).push(:avatar, :address, :name, :user_type)
    devise_parameter_sanitizer.for(:sign_up).push(:avatar, :address, :name, :user_type)
  end

  def after_sign_out_path_for(resource)
    user_session_path
  end


end
