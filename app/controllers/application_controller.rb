class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?




  def after_sign_in_path_for(resources)
    if resources.class == YoungUser
      if senior_user_signed_in?
        sign_out(current_senior_user)
      end
      young_user_path(current_young_user)
    elsif resources.class == SeniorUser
      if young_user_signed_in?
        sign_out(current_young_user)
      end
      senior_senior_user_path(current_senior_user)
    else
      root_path
    end
  end







  protected

  def is_not_guest_young_user
    young_user = current_young_user
    unless young_user.email != "guest@example.com"
      redirect_to young_users_path
    end
  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
