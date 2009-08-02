class HeadersController < ApplicationController
  
  before_filter :require_login, :except => [:index, :show]
  before_filter :can_edit, :only => [:edit, :update, :destroy]
  
  def index
    @headers = Header.paginate(:page => params[:page], :order => 'created_at desc')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @headers }
      format.fxml  { render :fxml => @headers }
    end
  end

  def show
    @header = Header.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @header }
      format.fxml  { render :fxml => @header }
    end
    
  end

  def new
  end

  def create
    @header = current_user.headers.build params[:header]
    
    respond_to do |format|
      if @header.save
        format.html { redirect_to(@header) }
        format.xml  { render :xml => @header, :status => :created, :location => @header }
        format.fxml  { render :fxml => @header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @header.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @header.errors }
      end
    end
  end

  def edit
    @header = Header.find(params[:id])
  end
  
  def update
    @header = Header.find(params[:id])
    
    respond_to do |format|
      if @header.update_attributes(params[:header])
        flash[:notice] = 'Workunit was successfully updated.'
        format.html { redirect_to(@header) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @header }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @header.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @header.errors }
      end
    end
  end

  def destroy
    @header = Header.find(params[:id])
    @header.destroy
    
    respond_to do |format|
      format.html { redirect_to(headers_path) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @header }
    end
  end
  
  def vote_up
    @header = Header.find(params[:id])
    @header.vote_up
    render :partial => 'votes.html.erb'
  end
  
  def vote_down
    @header = Header.find(params[:id])
    @header.vote_down
    render :partial => 'votes.html.erb'
  end  
end
