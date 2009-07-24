class Comment < ActiveRecord::Base

  attr_accessible :begetter_id, :begetter_type, :body
  
  belongs_to :begetter, :polymorphic => true, :counter_cache => true
  belongs_to :user
  
  validates_presence_of :user_id, :body, :begetter
    
  def self.get(page = 1)
    paginate(:page => page, :order => 'created_at desc', :include => :user)
  end
  
  def to_s
    body
  end
  
end
