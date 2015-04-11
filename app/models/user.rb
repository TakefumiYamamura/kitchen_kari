class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  has_many :images
  has_many :books
  has_attached_file :avatar, styles: { medium: '100x100#', thumb: "100x100#" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/png", "image/gif", "image/jpg"]
  scope :by_area_products, -> (area_params){where(area: area_params).map{|user| user.products}.flatten}
  # →これlike検索の意味あるか？
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
  enum user_type: %i(cook diner both)

end
