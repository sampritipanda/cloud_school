class SitesController < ApplicationController
  def join
    code = params[:user][:code]
    
    site = Site.find_by_code(code);
    
    if site == nil
      flash[:alert] = "No site exists with that code! Please re-enter the code and try again."
      redirect_to '/home'
    end
    
    site.users << current_user
    
    redirect_to site_path(site)
  end
end
