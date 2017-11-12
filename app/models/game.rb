class Game < ApplicationRecord
  validates_presence_of :name, :description, :players, :lifetime

  belongs_to :user
  belongs_to :game_kind
  belongs_to :category

  has_many :photos
  has_many :reservations

  accepts_nested_attributes_for :photos, allow_destroy: true
end
