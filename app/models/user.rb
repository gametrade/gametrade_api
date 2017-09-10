class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates_presence_of :name, :email, :identification_document, :birth_date
  validates_uniqueness_of :email, :identification_document
end
