class RanksController < ApplicationController
  
  before_filter :redirect_home, :only => [:show]
  before_filter :require_admin, :except => [:index]
  
  def index
    @ranks = Rank.find(:all, :order => 'min_posts asc')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ranks }
      format.fxml  { render :fxml => @ranks }
    end
  end
  
  def new
  end
  
  def create
    @rank = Rank.new(params[:rank])
    
    respond_to do |format|
      if @rank.save
        flash[:notice] = 'Workunit was successfully created.'
        format.html { redirect_to(ranks_path) }
        format.xml  { render :xml => @rank, :status => :created, :location => @rank }
        format.fxml  { render :fxml => @rank }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rank.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @rank.errors }
      end
    end
  end
  
  def edit
    @rank = Rank.find(params[:id])
  end
  
  def update
    @rank = Rank.find(params[:id])
    
    respond_to do |format|
      if @rank.update_attributes(params[:rank])
        flash[:notice] = 'Workunit was successfully updated.'
        format.html { redirect_to(ranks_path) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @rank }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rank.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @rank.errors }
      end
    end
  end
    
  def destroy
    @rank = Rank.find(params[:id])
    @rank.destroy
    
    respond_to do |format|
      format.html { redirect_to(ranks_path) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @rank }
    end
  end
end
