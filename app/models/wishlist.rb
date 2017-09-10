class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validate :belongs_mine

  def belongs_mine
    errors.add(:game, message: 'that game is mine') if game.user.id == user.id
  end
end
