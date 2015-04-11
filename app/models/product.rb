class Product < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_many :books
  has_attached_file :avatar, styles: { medium: "100x100#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/png", "image/gif", "image/jpg"]
  # geocoded_by :address
  # after_validation :geocode, if: Proc.new { |a| a.address_changed? }
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode, if: Proc.new { |a| a.latitude_changed? or a.longitude_changed? }
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
end
