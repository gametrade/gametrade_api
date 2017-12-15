class ReservationsManager
  attr_reader :reservation
  def initialize(params)
    @reservation = Reservation.new(params)
  end

  def create
    if reservation.game.permitted_instant_reservation
      @reservation.status = :reserved
      @reservation.game.update(status: :reserved)
    end

    reservation.total_value
    reservation.tap { |object| object.save }
  end

  def self.confirm(reservation_id)
    reservation = Reservation.find(reservation_id)

    reservation.update(status: :reserved)
    reservation.game.update(status: :reserved)
    reservation.tap { |object| object }
  end
end
