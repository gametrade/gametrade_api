class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  before_create :skip_confirmation!

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            :storage => :cloudinary,
                            :path => ':id/:style/:filename'

  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}

  has_one :address
  has_many :games
  has_many :wishlists
  has_many :reservations

  accepts_nested_attributes_for :address, allow_destroy: true
end
