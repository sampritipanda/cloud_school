class HomeworksController < ApplicationController
  def index
  end
  
  def show
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
end