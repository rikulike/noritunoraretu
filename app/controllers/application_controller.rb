class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?




  def after_sign_in_path_for(resources)
    if resources.class == YoungUser
      young_homes_about_path
    elsif resources.class == SeniorUser
      senior_homes_about_path
    else
      root_path
    end
  end







  protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
