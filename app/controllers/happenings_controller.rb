class HappeningsController < ApplicationController
  
  before_filter :require_login, :except => [:index, :show]
  before_filter :can_edit, :only => [:edit, :update, :destroy]
  
  def index
    @date = Time.parse("#{params[:date]} || Time.now.utc")
    @happenings = Happening.find(:all, :conditions => ['date between ? and ?', @date.strftime("%Y-%m") + '-01', @date.next_month.strftime("%Y-%m") + '-01'])
  end

  def show
    @happening = Happening.find(params[:id])
  end

  def new
  end

  def create
    @happening = current_user.happenings.build(params[:happening])
    if @happening.save
      redirect_to @happening and return true
    else
      render :action => "new"
    end
  end

  def edit
    @happening = Happening.find(params[:id])
  end

  def update
    @happening = Happening.find(params[:id])
    if @happening.update_attributes(params[:happening])
      redirect_to @happening
    else
      render :action => "edit"
    end
  end

  def destroy
    @happening = Happening.find(params[:id])
    @happening.destroy
    redirect_to happenings_path
  end
end
