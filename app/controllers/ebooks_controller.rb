class EbooksController < ApplicationController
  # GET /ebooks
  # GET /ebooks.json
  def index
    @ebooks = Ebook.where(:site_id => current_user.site.id)
    @ebook = Ebook.new
  end

  # GET /ebooks/1
  # GET /ebooks/1.json
  #ef show
  #  @ebook = Ebook.where(:id => params[:id], :site_id => current_user.site.id)[0]
  #end

  # GET /ebooks/new
  # GET /ebooks/new.json
  #def new
  #  @ebook = Ebook.new
  #end

  # GET /ebooks/1/edit
  def edit
    @ebook = Ebook.where(:id => params[:id], :site_id => current_user.site.id)[0]
  end

  # POST /ebooks
  # POST /ebooks.json
  def create
    #@ebook = Ebook.new(params[:ebook])
    @ebook = Ebook.create(params[:ebook])

    if @ebook
      @ebook.site = current_user.site
      @ebook.user = current_user
      @ebook.save!
      
      redirect_to site_ebooks_path(current_user.site.id), notice: 'Ebook was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /ebooks/1
  # PUT /ebooks/1.json
  def update
    @ebook = Ebook.where(:id => params[:id], :site_id => current_user.site.id)[0]

    if @ebook.update_attributes(params[:ebook])
      redirect_to site_ebooks_path(current_user.site.id), notice: 'Ebook was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /ebooks/1
  # DELETE /ebooks/1.json
  def destroy
    @ebook = Ebook.where(:id => params[:id], :site_id => current_user.site.id)[0]
    @ebook.destroy

    redirect_to site_ebooks_url(current_user.site.id)
  end
end
