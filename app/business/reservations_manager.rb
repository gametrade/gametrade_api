class ReservationsManager
  attr_reader :reservation
  def initialize(params)
    @reservation = Reservation.new(params)
  end

  def total_value
    reservation_days = (reservation.start_date.to_date..reservation.end_date.to_date).count
    reservation.game.price.to_f * reservation_days
  end

  def create
    if reservation.game.permitted_instant_reservation
      @reservation.status = :reserved
    end

    @reservation.value = total_value
    reservation.tap { |object| object.save }
  end

  def self.confirm(reservation_id)
    reservation = Reservation.find(reservation_id)

    reservation.update(status: :reserved)
    reservation.tap { |object| object }
  end

  def self.cancel(reservation_id)
    reservation = Reservation.find(reservation_id)

    reservation.update(status: :cancelled)
    reservation.tap { |object| object }
  end
end
