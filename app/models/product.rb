class Product < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_attached_file :avatar, styles: { medium: "100x100>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/png", "image/gif", "image/jpg"]
end
