class UploadsController < ApplicationController
  
  before_filter :redirect_home, :only => [:show, :edit, :update]
  before_filter :require_login, :except => [:index]
  before_filter :can_edit, :only => [:destroy]
  
  rescue_from Errno::ENOENT, :with => :url_upload_not_found
  rescue_from Errno::ETIMEDOUT, :with => :url_upload_not_found
  rescue_from OpenURI::HTTPError, :with => :url_upload_not_found
  
  def index
    @uploads = Upload.paginate(:page => params[:page], :order => 'updated_at desc')
  end

  def new
  end

  def create
    @upload = current_user.uploads.new(params[:upload])
    
    respond_to do |format|
      if @upload.save
        # conditional flash msg that gives me the url of the newly uploaded file
        if CONFIG['s3']
          flash[:notice] = "#{@upload.attachment.url.split('?').first}"
        else
          flash[:notice] = "#{root_url.chop + @upload.attachment.url.split('?').first}"
        end
        format.html { redirect_to(files_path) }
        format.xml  { render :xml => @upload, :status => :created, :location => @upload }
        format.fxml  { render :fxml => @upload }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @upload.errors }
      end
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    
    respond_to do |format|
      format.html { redirect_to(files_path) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @upload }
    end
  end
end
