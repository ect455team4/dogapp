class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  #validates :content, :presense => true, :length => { :maximum => 200 }
  #validates :user_id, :presense => true

  default_scope :order => 'microposts.created_at'
end
