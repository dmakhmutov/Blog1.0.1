class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tag_list, :tag_cloud
  acts_as_taggable

  validates :name,    :presence => true
  validates :title,   :presence => true,
                      :length => {:minimum => 5 , :maximum => 120}
  validates :content, :presence => true,
                      :length => {:minimum => 5, :maximum => 10000}
  has_many :comments, :dependent => :destroy

end
