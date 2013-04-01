class HomeworksController < ApplicationController
  def index
    date = nil
    ((params[:week] || 2).to_i - 1).times do
      date = (date || Time.now.to_date) - (7.days)
    end
    date = Time.now.to_date if date.nil?
    
    @start_date = date.beginning_of_week(:sunday)
    @end_date = date.end_of_week(:sunday)
    
    params[:type] ||= :submission_date 
    
    @homeworks = Homework.where(:site_id => current_user.site.id, params[:type] => (@start_date)..(@end_date))
    
    @type = params[:type]
    @week = params[:week].to_i
  end
  
  def show
    @homework = Homework.where("id = ? AND site_id = ?", params[:id], current_user.site.id)[0]
  end
  
  def new
    @homework = Homework.new
  end
  
  def create
    @homework = Homework.new(params[:homework])
    if @homework.save
      current_user.site.homeworks << @homework
      flash[:notice] = "Homework for #{@homework.issue_date} was added successfully"
      redirect_to site_path(current_user.site.id)
    else
      flash[:error] = "There was error in creating the homework. Please try again."
      render 'new'
    end
  end
  
  def edit
    @homework = Homework.where("id = ? AND site_id = ?", params[:id], current_user.site.id)[0]
    if @homework.nil?
      redirect_to site_path(current_user.site.id)
    end
  end
  
  def update
    @homework = Homework.where("id = ? AND site_id = ?", params[:id], current_user.site.id)[0]
    if @homework.nil?
      redirect_to site_path(current_user.site.id)
    end
    @homework.update_attributes!(params[:homework])
    flash[:notice] = "Homework for #{@homework.issue_date} was successfully updated."
    redirect_to site_homework_path(current_user.site.id, @homework.id)
  end
  
  def destroy
  end
  
  def search
    return unless params[:query].present?
    
    @homeworks = Homework.search(params[:query], :load => true)
  end
end