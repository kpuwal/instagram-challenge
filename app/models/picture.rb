class Picture < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { high: "600x600>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/normal/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, length: { minimum: 3 }, uniqueness: true
end
