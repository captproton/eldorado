class SettingsController < ApplicationController

  before_filter :redirect_home, :except => [:index, :update]
  before_filter :require_admin
  
  def index
    @settings = Setting.find(:first)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settings }
      format.fxml  { render :fxml => @settings }
    end
  end
    
  def update 
    @setting = Setting.find(params[:id])
    params[:setting][:time_zone] = params[:settings][:time_zone] unless params[:settings].nil? # hack for form plural issue
    @setting.update_attributes(params[:setting])
    
    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to(settings_path) }
        format.xml  { head :ok }
        format.fxml  { render :fxml => @setting }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
        format.fxml  { render :fxml => @setting.errors }
      end
    end
  end
end
