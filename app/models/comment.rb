class Comment < ActiveRecord::Base
  
  belongs_to :user
  
  # validates :title
  # validates :content, presence => true
  validates_presence_of :content
end
