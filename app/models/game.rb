class Game < ApplicationRecord
  validates_presence_of :name, :description, :players, on: :create

  belongs_to :user
  belongs_to :game_kind
  belongs_to :theme

  has_many :photos
  has_many :reservations

  accepts_nested_attributes_for :photos, allow_destroy: true
end
