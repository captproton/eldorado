class Article < ActiveRecord::Base
  
  acts_as_taggable_on :blogs, :stories, :interests #different categories of Articles.  Interests are just general tags
  
  attr_accessible :title, :body
  
  belongs_to :user, :counter_cache => true
  has_many :comments, :as => :begetter, :dependent => :destroy
  
  validates_presence_of :user_id, :title, :body
    
  def self.get(page = 1)
    paginate(:page => page, :per_page => 10, :order => 'created_at desc', :include => :user)
  end
  
  def to_s
    title
  end
  
  def to_param
    "#{id}-#{to_s.parameterize}"
  end
  
  def spiel_tag(spiel_type)
    Tagging.find(:all, :conditions => ['context = ?', spiel_type])
  end
  
  def self.find_within_context(tag_list, context)
    self.tagged_with(tag_list, :on => context.to_sym)
  end
  
  def self.tagging_contexts
    tagging_contexts = Tagging.find(:all, :select => "DISTINCT context")
  end
  
  def self.tags_of_a_context(context)
    tags = Tagging.find(:all, :conditions => ["context = ?", context ], :select => "DISTINCT tag_id")
  end
end
