class AvatarsController < ApplicationController
  
  before_filter :redirect_home, :only => [:show, :edit, :update]
  before_filter :require_login, :except => [:index]
  before_filter :can_edit, :only => [:destroy]
  
  def index
    @avatars = Avatar.paginate(:page => params[:page], :order => 'updated_at desc')
    
    respond_to do |format|
      format.html # index.html.erb
      format.rss # index.html.erb
      format.xml  { render :xml => @avatars }
      format.fxml  { render :fxml => @avatars.to_fxml(:methods => [:attachment_url]) }
    end
    
  end
  
  def new
  end
  
  def create
    @avatar = current_user.avatars.build(params[:avatar])
   
    respond_to do |format|
      if @avatar.save
        format.html { redirect_to(avatars_path) }
        format.xml  { render :xml => @avatar, :status => :created, :location => @article }
        format.fxml  { render :fxml => @avatar.to_fxml(:methods => [:attachment_url]) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @avatar.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @avatar.errors }
      end
    end
  end
  
  def destroy
    @avatar = Avatar.find(params[:id])
    @avatar.destroy
    redirect_to avatars_path
  end
  
  def select
    @avatar = Avatar.find(params[:id])
    if @avatar.current_avatar_user
      flash[:notice] = "This avatar is already in use"
      redirect_to avatars_path 
    else
      current_user.select_avatar(@avatar)
      flash[:notice] = "Avatar selected"
      redirect_to avatars_path
    end
  end
    
  def deselect
    @avatar = Avatar.find(params[:id])
    if @avatar.current_avatar_user == current_user
      current_user.clear_avatar
      flash[:notice] = "Avatar cleared"
    else
      flash[:notice] = "This avatar is already in use"
    end
    redirect_to avatars_path
  end
  
end
