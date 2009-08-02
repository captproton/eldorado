class CategoriesController < ApplicationController
  
  before_filter :require_admin, :except => [:index, :show]

  def index
    @categories = Category.find(:all)
    
    respond_to do |format|
      format.html { redirect_to forum_root_path }# index.html.erb
      format.fxml  { render :fxml => @categories }
      
      
    end
    
  end
  
  def show
    @category = Category.find(params[:id], :include => :forums)
    @forums = @category.forums
    
    respond_to do |format|
      format.html {
        @topics = Topic.get(params[:page], 30, ["forum_id in (?)", @forums.collect(&:id)])
        render :template => 'topics/index'
        
      }# show.html.erb
      format.xml  { render :xml => @category }
      format.fxml  { render :fxml => @category }
      
    end
    
  end
  
  def new
  end
    
  def create
    @category = Category.new(params[:category])

   
    respond_to do |format|
      if @category.save
        flash[:notice] = 'Sprint was successfully created.'
        format.html { redirect_to forum_root_path }
        format.xml  { render :xml => @sprint, :status => :created, :location => @sprint }
        format.fxml  { render :fxml => @sprint }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sprint.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @sprint.errors }
      end
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
        
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @category }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @category.errors }
      end
    end
  end
    
  def destroy
    @category = Category.find(params[:id])
    
    respond_to do |format|
      format.html { 
        if params[:confirm] != "1"
          flash[:notice] = "You must check the confirmation box"
          redirect_to confirm_delete_category_path(@category)
        else
          @category.destroy
          redirect_to forum_root_path
        end
      }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @category }
    end
  end
  
  def confirm_delete
    @category = Category.find(params[:id])
  end
end
