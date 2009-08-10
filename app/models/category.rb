class Category < ActiveRecord::Base
  acts_as_taggable_on :spielman
  
  attr_accessible :name, :position
  
  has_many :forums, :order => 'forums.position', :dependent => :destroy
  
  validates_presence_of     :name, :position
  validates_uniqueness_of   :name, :case_sensitive => false
    
  def to_s
    name
  end
  
  def to_param
    "#{id}-#{to_s.parameterize}"
  end
  
end
