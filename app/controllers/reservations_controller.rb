class ReservationsController < ApplicationController
  before_action :authentication_user!

  def index
    my_reservations = current_user.reservations
    my_requests =
      Reservation.all.joins(:game).where(games: { user_id: current_user.id })

    render template: 'reservations/index',
           locals: { my_reservations: my_reservations,
                     my_requests: my_requests }
  end

  def create
    reservation = ReservationsManager.new(permitted_attributes).create
    render json: reservation.errors.empty? ? reservation : reservation.errors
  end

  def confirm
    reservation = ReservationsManager.confirm(params.require(:id))
    render json: reservation.errors.empty? ? reservation : reservation.errors
  end

  private

  def permitted_attributes
    params.require(:reservation).
      permit(:user_id, :game_id, :start_date, :end_date)
  end
end
