class ArticlesController < ApplicationController

  before_filter :find_parent_user_or_class, :only => [:index]
  before_filter :require_login, :except => [:index, :show, :archives]
  before_filter :can_edit, :only => [:edit, :update, :destroy]
  ## before_filter :spiels, :only => [:index, :show] #buggy for articles, but not speils controller

  def index
    spiels
    if params[:tag_id]
      @articles     = Article.find(:all , :conditions => { :id => @spiel_tag_ids}, :order => 'created_at DESC' )      
    else
      @articles     = @parent.get(params[:page])
    end
    ## Article.find(:all, :conditions => ["id IN (?)", @spiel_tag_ids])
    
    ## @articles     = @parent.get(params[:page])
    @spiel_types = Tagging.find(:all, :select => "DISTINCT context", :order=> 'context').map(&:context)
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.rss # index.html.erb
      format.xml  { render :xml => @articles }
      format.fxml  { render :fxml => @articles.to_fxml(:methods => [:attachment_url]) }
    end
    
  end

  def show
    spiels
    @article = Article.find(params[:id])
    @comments = @article.comments(:include => :user)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
      format.fxml  { render :fxml => @article.to_fxml(:methods => [:attachment_url]) }
    end
  end

  def new
    @article = Article.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.new(params[:article])
    
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Address was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
        format.fxml  { render :fxml => @article.to_fxml(:methods => [:attachment_url]) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @article.errors }
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to(@article)
    else
      render :action => "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(blog_path)
  end
  
  def archives
    @articles = Article.all(:order => 'created_at desc', :include => :user)
  end
  
  private
  
  def spiels

    @spiel_tags = Tagging.find(:all, :select => "taggings.tag_id,taggings.context", :group => "taggings.tag_id, taggings.context", :order => 'taggings.context')
    
    @spiel_tag_ids  = Tagging.find(:all, :select => "DISTINCT tag_id, taggable_id", :conditions => ['tag_id = ?', params[:tag_id]]).map(&:taggable_id)
    
    
    ##@articles = Article.find(:all , :conditions => { :id => @spiel_tag_ids}, :order => 'created_at DESC' )
    
  end
end
