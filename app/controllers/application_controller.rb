class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_current_user
  before_filter :configure_devise_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.class == AdminUser
      admin_root_path
    else
      if resource.account
        dashboard_path
      else
        new_account_path
      end
    end
  end


  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation)
    end
  end

private

  def set_current_user
    return true unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

end
