class SpielsController < ApplicationController
  def index
    @spiels = Tagging.find(:all, :select => "DISTINCT context").map(&:context)
    
    
  end

  def show 
    @spiels = Article.tag_counts_on(:stories)   
    @tag = Tag.find(params[:id])
    @spiel_articles = Article.tagged_with(@tag.name, :on => :stories)
    
    
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
