class UserController < ApplicationController
  before_action :authenticate_user!

  def show
    user = current_user.find(param.require(:id))
    render template: 'users/show', locals: { user: user }
  end

  def update
    user = current_user.update_attributes(permitted_attributes)
    render template: 'users/show', locals: { user: user }
  end

  private

  def permitted_attributes
    params.require(:user).
      permit(:name, :surname, :email, :identification_document, :birth_date,
             :contact)
  end
end
