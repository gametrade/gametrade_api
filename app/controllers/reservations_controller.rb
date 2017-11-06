class ReservationsController < ApplicationController
  # before_action :authentication_user!

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
