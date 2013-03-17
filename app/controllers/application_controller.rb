class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    @site = current_user.site
    
    if @site
      site_path(@site)
    else
      sites_join_path
    end
  end
  
  def paper_bg
    (params[:controller] == "sites" && (params[:action] == "join" || params[:action] == "new" || params[:action] == "create")) || (/^(devise)/.match(params[:controller]))
  end
  
  helper_method :paper_bg
end
