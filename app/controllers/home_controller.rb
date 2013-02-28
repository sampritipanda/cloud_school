class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    render 'home/index' unless current_user.site
    
    redirect_to ''
  end
end
