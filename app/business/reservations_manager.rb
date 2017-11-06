class ReservationsManager
  attr_reader :reservation
  def initialize(params)
    @reservation = Reservation.new(params)
  end

  def create
    if reservation.game.permitted_instant_reservation
      reservation.status = :confirmed
    end

    reservation.total_value
    reservation.tap { |object| object.save }
  end
end
