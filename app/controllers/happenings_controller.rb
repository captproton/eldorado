class HappeningsController < ApplicationController
  
  before_filter :require_login, :except => [:index, :show]
  before_filter :can_edit, :only => [:edit, :update, :destroy]
  
  def index
    @date = Time.parse("#{params[:date]} || Time.now.utc")
    @happenings = Happening.find(:all, :conditions => ['date between ? and ?', @date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @happenings }
      format.fxml  { render :fxml => @happenings }
    end
  end

  def show
    @happening = Happening.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @happening }
      format.fxml  { render :fxml => @happening }
    end    
  end

  def new
  end

  def create
    @happening = current_user.happenings.build(params[:happening])
     
    respond_to do |format|
      if @happening.save
        format.html { redirect_to @happening and return true }
        format.xml  { render :xml => @happening, :status => :created, :location => @happening }
        format.fxml  { render :fxml => @happening }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @happening.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @happening.errors }
      end
    end
  end

  def edit
    @happening = Happening.find(params[:id])
  end

  def update
    @happening = Happening.find(params[:id])

    respond_to do |format|
      if @happening.update_attributes(params[:happening])
        format.html { redirect_to(@happening) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @happening }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @happening.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @happening.errors }
      end
    end
  end

  def destroy
    @happening = Happening.find(params[:id])
    @happening.destroy
    
    respond_to do |format|
      format.html { redirect_to(happenings_path) }
      format.xml  { head :ok }
      format.fxml  { render :fxml => @happening }
    end
  end
end
