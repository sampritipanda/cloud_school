class SitesController < ApplicationController
  def show
    
  end
  
  def join
    return unless request.post?
    
    code = params[:user][:code]
    
    site = Site.find_by_code(code);
    
    if site == nil
      flash[:alert] = "No site exists with that code! Please re-enter the code and try again."
      redirect_to sites_join_path
    end
    
    site.users << current_user
    
    redirect_to site_path(site)
  end
end
