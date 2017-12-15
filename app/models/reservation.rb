class Reservation < ApplicationRecord
  enum status: %i[pending confirmed reserved finished cancelled]

  belongs_to :game
  belongs_to :user

  validate :validate_belongs_mine, :validate_start_date, :validate_end_date,
           :validate_available
  before_save :set_status

  def total_value
    reservation_days = (start_date.to_date..end_date.to_date).count
    self.value = game.price.to_f * reservation_days
  end

  private

  def set_status
    self.status ||= :pending
  end

  def validate_available
    if game.status.to_sym != :available
      errors.add(:game_id, message: 'game is not available')
    end
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
