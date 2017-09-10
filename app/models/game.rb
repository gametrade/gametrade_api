class Game < ApplicationRecord
  belongs_to :user
  belongs_to :game_kind
  belongs_to :category

  validates_presence_of :name, :description, :players, :lifetime
end
