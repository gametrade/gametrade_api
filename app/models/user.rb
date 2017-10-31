class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" },
                            :storage => :cloudinary,
                            :path => ':id/:style/:filename'

  validates_presence_of :name, :email, :identification_document, :birth_date
  validates_uniqueness_of :email, :identification_document

  has_one :address
  has_many :wishlists

  accepts_nested_attributes_for :address, allow_destroy: true
end
