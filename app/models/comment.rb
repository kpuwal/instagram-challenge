class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
   
  validates :rating, inclusion: (0..1)
end
