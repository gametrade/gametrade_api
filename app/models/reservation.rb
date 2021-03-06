class Reservation < ApplicationRecord
  enum status: %i[pending confirmed reserved finished cancelled]

  belongs_to :game
  belongs_to :user

  validate :validate_belongs_mine, :validate_start_date, :validate_end_date
  before_save :set_status

  private

  def set_status
    self.status ||= :pending
  end

  def validate_belongs_mine
    if game.user.id == user.id
      errors.add(:game_id, message: 'the owner should not reserve the game itself')
    end
  end

  def validate_start_date
    if start_date > end_date
      errors.add(:start_date, message: 'deve ser menor ou igual que end_date')
    end
  end

  def validate_end_date
    if end_date < start_date
      errors.add(:end_date, message: 'deve ser maior ou igual que start_date')
    end
  end
end
