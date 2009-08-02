class CommentsController < ApplicationController
  
  before_filter :redirect_home, :only => [:new]
  before_filter :require_login, :except => [:index, :show]
  before_filter :can_edit, :only => [:edit, :update, :destroy]
  
  def index
    
    respond_to do |format|
      format.html {
        @comments = Comment.paginate(:page => params[:page], 
          :order => 'created_at desc', :include => [:begetter, :user])
      }
      format.xml  { 
        @comments = Comment.paginate(:page => params[:page], 
          :order => 'created_at desc', :include => [:begetter, :user])
        render :xml => @comments 
      }
      format.fxml  { 
        @comments = Comment.find(:all)
        render :fxml => @comments.to_fxml(:include => [:begetter, :user])
      }
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
      format.fxml  { render :fxml => @comment }
    end
  end
  
  def new
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = current_user.comments.build(params[:comment])
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to polymorphic_path(@comment.begetter) + '#c' + @comment.id.to_s }
        format.xml  { render :xml => @comment, :status => :created, :location => @workunit }
        format.fxml  { render :fxml => @comment }
      else
        format.html { redirect_to polymorphic_path(@comment.begetter) + '#comments' }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @comment.errors }
      end
    end
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to polymorphic_path(@comment.begetter) + '#c' + @comment.id.to_s }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @comment }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @comment.errors }
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to polymorphic_path(@comment.begetter) + '#comments' }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @comment }
    end
  end
end
