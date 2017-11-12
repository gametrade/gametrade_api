class ReservationsController < ApplicationController
  # before_action :authentication_user!

  def index
    current_user = params.require(:id)
    reservations = Reservation.where(user_id: current_user).includes(:user, :game)
    render template: 'reservations/index', locals: { reservations: reservations }
  end

  def create
    reservation = ReservationsManager.new(permitted_attributes).create
    render json: reservation.errors.empty? ? reservation : reservation.errors
  end

  private

  def permitted_attributes
    params.require(:reservation).
      permit(:user_id, :game_id, :start_date, :end_date)
  end
end
