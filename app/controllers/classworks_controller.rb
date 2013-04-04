class ClassworksController < ApplicationController
  def new
    @classwork = Classwork.new
  end

  def create
    redirect_to site_path(current_user.site.id) unless current_user.admin
    @classwork = Classwork.new(params[:classwork])
    if @classwork.save
      current_user.site.classworks << @classwork
      flash[:notice] = "Classwork for #{@classwork.date} was added successfully"
      redirect_to site_path(current_user.site.id)
    else
      flash[:error] = "There was error in creating the classwork. Please try again."
      render 'new'
    end
  end
  
  def edit
    @classwork = Classwork.where("id = ? AND site_id = ?", params[:id], current_user.site.id)[0]
    if @classwork.nil?
      redirect_to site_path(current_user.site.id)
    end
  end

  def update
    redirect_to site_path(current_user.site.id) unless current_user.admin
    @classwork = Classwork.where("id = ? AND site_id = ?", params[:id], current_user.site.id)[0]
    if @classwork.nil?
      redirect_to site_path(current_user.site.id)
    end
    @classwork.update_attributes!(params[:classwork])
    flash[:notice] = "Classwork for #{@classwork.date} was successfully updated."
    redirect_to site_path(current_user.site.id) + "?utf8=%E2%9C%93&datepicker=#{@classwork.date.day}%2F#{@classwork.date.month}%2F#{@classwork.date.year}"
  end

  def destroy
    redirect_to site_path(current_user.site.id) unless current_user.admin
    @classwork = Classwork.where("id = ? AND site_id = ?", params[:id], current_user.site.id)[0]
    @classwork.destroy
    redirect_to site_path(current_user.site.id)
  end
end