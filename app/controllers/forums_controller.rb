class ForumsController < ApplicationController
  
  before_filter :require_admin, :except => [:index, :show]
  
  def index
    @categories = Category.find(:all, :include => [:forums], :order => 'categories.position, forums.position')
    @posts_count = Forum.sum('posts_count')
    @topics_count = Forum.sum('topics_count')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
      format.fxml  { render :fxml => @categories }
    end
  end

  def show
    @forum = Forum.find(params[:id], :include => :category)
    
    respond_to do |format|
      format.html { 
        @topics = @forum.topics.paginate(:page => params[:page], :include => [:user, :last_poster], :order => 'sticky desc, last_post_at desc')
        render :template => 'topics/index'        
      } # index.html.erb
      format.xml  { render :xml => @forum }
      format.fxml  { render :fxml => @forum }
    end

  end
  
  def new
    @forum = Forum.new(:category_id => params[:category_id])
    
    respond_to do |format|
      format.html { # new.html.erb
        redirect_to new_category_path if Category.count == 0
      }
      format.xml  { render :xml => @forum }
    end
  end
  
  def create
    @forum = Forum.new(params[:forum])
    
    respond_to do |format|
      if @forum.save
        format.html { redirect_to(@forum) }
        format.xml  { render :xml => @sprint, :status => :created, :location => @forum }
        format.fxml  { render :fxml => @sprint }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forum.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @forum.errors }
      end
    end
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def update
    @forum = Forum.find(params[:id])
    
    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        flash[:notice] = 'Sprint was successfully updated.'
        format.html { redirect_to(@forum) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @forum }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forum.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @forum.errors }
      end
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    
    respond_to do |format|
      format.html { 
        if params[:confirm] != "1"
          flash[:notice] = "You must check the confirmation box"
          redirect_to confirm_delete_forum_path(@forum)
        else
          @forum.destroy
          redirect_to forum_root_path
        end        
      }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @forum }
    end
  end
  
  def confirm_delete
    @forum = Forum.find(params[:id])
  end
end
