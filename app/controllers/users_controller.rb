class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def index
    users = User.ransack(params[:q])
    render template: 'users/index', locals: { users: users.result }
  end

  def show
    user = User.find(params.require(:id))
    render template: 'users/show', locals: { user: user }
  end

  def update
    user = current_user.update_attributes(permitted_attributes)
    if user.errors.empty?
      render template: 'users/show', locals: { user: user }
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def permitted_attributes
    params.require(:user).
      permit(:name, :surname, :email, :identification_document, :birth_date,
             :contact)
  end
end
