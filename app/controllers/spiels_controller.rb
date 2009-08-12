class SpielsController < ApplicationController
  def index
    @spiels = Tagging.find(:all, :select => "DISTINCT context").map(&:context)
    
    
  end

  def show 
    @spiel_types = Tagging.find(:all, :select => "DISTINCT context")
    @tagging = Tagging.find(params[:id])

    @spiel_tags = Tagging.find(:all, :select => "DISTINCT tag_id, taggable_id", :conditions => ['context = ?', @tagging.context])
    @spiel_tag  = Tagging.find(:first, :select => "DISTINCT tag_id, taggable_id", :conditions => ['context = ?', @tagging.context])
    @spiel_tag_ids  = Tagging.find(:all, :select => "DISTINCT tag_id, taggable_id", :conditions => ['context = ?', @tagging.context]).map(&:taggable_id)
    

    
    @articles = Article.find(:all , :conditions => { :id => @spiel_tag_ids}, :order => 'created_at DESC' )
    
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
  

end
