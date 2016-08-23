class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  
  belongs_to :user
  validates :title, length: { minimum: 3 }, uniqueness: true
end
