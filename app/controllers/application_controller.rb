class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    @site = current_user.site
    
    if @site
      site_path(@site)
    else
      sites_join_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation, :name, :birthday
    end
  end
end
