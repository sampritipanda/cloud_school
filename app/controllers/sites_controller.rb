class SitesController < ApplicationController
  def test
    
  end
  
  def new
    @site = Site.new
  end
  
  def create
    @site = Site.new(params[:site])
    if @site.save
      @site.users << current_user
      
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
      @date = Date.strptime(params[:datepicker], "%d/%m/%Y").to_date
      @classwork = Classwork.where("date = ? AND site_id = ?", @date, current_user.site.id)[0]
    else
      @date = Time.now.to_date
      @classwork = Classwork.where("date = ? AND site_id = ?", @date, current_user.site.id)[0]
    end
    
    if @classwork
      @classwork_id = @classwork.id 
      @classwork = @classwork.content
      @available = true
    else
      @classwork = "No classwork available for #{params[:datepicker] || "today"}"
      @available = false
    end
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
end