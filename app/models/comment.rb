class Comment < ActiveRecord::Base
  validates :rating, inclusion: (0..1)
end
