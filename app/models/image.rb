class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :avatar, :content_type => ["image/jpeg", "image/png"]
end
