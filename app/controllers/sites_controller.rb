require 'open-uri'

class SitesController < ApplicationController
  def new
    @site = Site.new
  end
  
  def create
    @site = Site.new(site_params)
    if @site.save
      @site.users << current_user
      current_user.admin = true
      current_user.save!
      
      # Useless Start
      #prms = {:date => Time.now.to_date}
      #prms[:content] = "Maths - Chapter 12 Exercise 13\nEnglish - Literature Reader - Caesar - Page 3 and 4\nPhysics - Sound - Exercises."
      
      #@classwork = Classwork.new(prms)
      #@classwork.save
      
      #@site.classworks << @classwork
      
      #prms = {:date => Time.now.to_date.yesterday.yesterday}
      #prms[:content] = "Maths - Chapter 12 Exercise 13\n"
      
      #@classwork = Classwork.new(prms)
      #@classwork.save
      
      #@site.classworks << @classwork
      # Useless End
      
      flash[:notice] = "#{@site.name} was successfully created."
      redirect_to site_path(@site)
    else
      render 'new'
    end
  end
  
  def show
    if params[:datepicker]
      @date = Date.strptime(params[:datepicker], "%B %d, %Y").to_date
    else
      @date = Time.now.to_date
    end
    
    @classwork = Classwork.where("date = ? AND site_id = ?", @date, current_user.site.id)[0]
    @homeworks = Homework.where("issue_date = ? AND site_id = ?", @date, current_user.site.id)
    
    if @classwork
      @classwork.views = (@classwork.views || 0) + 1
      @classwork.save!
      @classwork_id = @classwork.id 
      @classwork = @classwork.content
      @available = true
    end
    if @homeworks.size == 0
      @homeworks = "No homework available for #{params[:datepicker] || "today"}"
    end
    if not @classwork
      @classwork = "No classwork available for #{params[:datepicker] || "today"}"
    end
    
    @link, @name = bing
  end
   
  def join
    return unless request.post?
    
    code = params[:site][:code]
    
    site = Site.find_by_code(code);
    
    if site == nil
      flash[:alert] = "No site exists with that code! Please re-enter the code and try again."
      redirect_to sites_join_path
    end
    
    site.users << current_user
    
    redirect_to site_path(site)
  end
  
  def bing
    source = open("http://www.bing.com").read
    
    link_regexp = /g_img=\{url:'(.+)',id:/
    source =~ link_regexp
    link = 'http://bing.com' + $1
    
    name_regexp = /class="sc_light" id="sh_cp" title="(.+) \(.+\)" h="ID=/
    source =~ name_regexp
    name_part = $1
    
    return link, name_part
  end

  private

  def site_params
    params.require(:site).permit(:name, :url, :code)
  end
end
