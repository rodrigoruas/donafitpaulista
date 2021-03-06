class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    meals_path
  end

  def after_sign_up_path_for(resource)
    meals_path
  end

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
   end

   def check_admin
     redirect_to root_path unless current_user.admin == true
   end
end
