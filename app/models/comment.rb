class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter
  belongs_to :post

  validates :body, :commenter, :presence => true
end
