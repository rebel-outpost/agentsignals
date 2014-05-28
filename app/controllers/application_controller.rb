class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :configure_devise_params, if: :devise_controller?
  before_filter :clients

  def clients
    @clients = current_user.clients
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    else
      if resource.account
        dashboard_path
      else
        new_account_path
      end
    end
  end

  # Need to refactor to this
  # def after_sign_in_path_for(resource)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  # end

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation)
    end
  end

end
