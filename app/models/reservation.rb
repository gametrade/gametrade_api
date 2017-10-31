class Reservation < ApplicationRecord
  enum status: %i[pending confirmed reseved cancelled]

  belongs_to :game
  belongs_to :user

  validate :belongs_mine

  def belongs_mine
    errors.add(:game, message: 'that game is mine') if game.user.id == user.id
  end
end
