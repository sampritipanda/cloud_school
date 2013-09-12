class AdminController < ApplicationController
  def index
    redirect_to site_path(current_user.site.id) unless current_user.sampriti
  end
  
  def run
    if not current_user.sampriti
      redirect_to site_path(current_user.site.id)
    end

    @resource = eval(params[:eval]) unless params[:eval].nil?
    
    render "admin/index"
  end
end
