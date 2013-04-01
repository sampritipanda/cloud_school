class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.where(:site_id => current_user.site.id)
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @announcement = Announcement.where(:id => params[:id], :site_id => current_user.site.id)[0]
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
    @announcement = Announcement.where(:id => params[:id], :site_id => current_user.site.id)[0]
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.create(params[:announcement])
    if @announcement
      @announcement.site_id = current_user.site.id
      @announcement.save!
      redirect_to site_announcement_path(current_user.site.id, @announcement.id), notice: 'Announcement was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    @announcement = Announcement.where(:id => params[:id], :site_id => current_user.site.id)[0]

    if @announcement.update_attributes(params[:announcement])
      redirect_to site_announcement_path(current_user.site.id, @announcement.id), notice: 'Announcement was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement = Announcement.where(:id => params[:id], :site_id => current_user.site.id)[0]
    @announcement.destroy

    respond_to do |format|
      redirect_to site_announcements_path(current_user.site.id)
    end
  end
end