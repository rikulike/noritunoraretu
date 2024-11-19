class ApplicationController < ActionController::Base
  before_action :authenticate_young_user!, except: [:top], unless: :admin_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_young_user_sign_in_path_for(resources)
    homes_about_path
  end

  def after_senior_user_sign_in_path_for(resources)
    root_path
  end 
  
  private

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
