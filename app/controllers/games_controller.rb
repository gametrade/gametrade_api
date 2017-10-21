class GamesController < ApplicationController
  # before_action :authentication_user!, except: [:index, :show]

  def index
    search = Game.ransack(params[:q])
    render json: search.result
  end

  def show
    game = Game.find(params.require(:id))
    render template: 'games/show', locals: { game: game }
  end

  def create
    game = Game.new(permitted_attributes)
    if game.save
      render template: 'games/show', locals: { game: game }
    else
      render json: game.errors
    end
  end

  def update
    game = user_game.find(:id)
    if game.update_attributes(permitted_attributes)
      render template: 'games/show', locals: { game: game }
    else
      render json game.errors
    end
  end

  def delete
    game = user_game.find(:id)
    game.delete
    render :index
  end

  private

  def permitted_attributes
    params.require(:game).
      permit(:name, :description, :launch_date, :lifetime, :players,
             :game_kind_id, :category_id, :user_id, photos_attributes: [:photo])
      end

  def user_game
    current_user.games
  end
end
