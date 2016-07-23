class Picture < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, length: { minimum: 3 }, uniqueness: true
end
