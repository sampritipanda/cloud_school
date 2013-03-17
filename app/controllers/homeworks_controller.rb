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
  end
  
  def update
  end
  
  def destroy
  end
end