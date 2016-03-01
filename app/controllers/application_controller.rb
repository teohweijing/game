class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exeption|
  	flash[:error] = "Access denied!"
  	redirect_to root_url
  end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name << :bank_name << :bank_acc << :phone_no
  	devise_parameter_sanitizer.for(:account_update) <<:name << :bank_name << :bank_acc << :phone_no
  end

end
