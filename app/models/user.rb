class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :products
  has_many :images
  has_many :books
  has_many :schedule
  belongs_to :place
  has_attached_file :avatar, styles: { medium: '100x100#', thumb: "100x100#" }
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/png", "image/gif", "image/jpg"]
  scope :by_area_products, -> (area_params){where(area: area_params).map{|user| user.products}.flatten}
  # →これlike検索の意味あるか？
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
  enum user_type: %i(cook diner both)

  class << self
    def create_with_omniauth(auth)
      image = auth["info"]["image"]
      require "open-uri"
      require "open_uri_redirections"
      file = open(auth.info.image, :allow_redirections => :safe)
      User.create(provider: auth["provider"],
                  uid: auth["uid"],
                  name: auth["info"]["name"],
                  avatar: file,
                  username: auth["info"]["name"],
                  screen_name: auth["info"]["nickname"],
                  email: User.create_unique_email,
                  password: Devise.friendly_token[0,20],
                  user_type: 2
                  )
    end

    def create_unique_string
      SecureRandom.uuid
    end

    def create_unique_email
      User.create_unique_string + "@example.com"
    end
  end

end
