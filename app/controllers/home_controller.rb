class HomeController < ApplicationController
  def index
    @site = current_user.site
    redirect_to site_path(@site) if @site
  end
end
