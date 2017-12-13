class GamesController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]

  def index
    search = Game.ransack(params[:q]).
                  result.order(created_at: :desc)

    render template: 'games/index',
           locals: { games: search.page(params[:page]).
                     per_page(per_page) }
  end

  def show
    game = Game.find(params.require(:id))
    render template: 'games/show', locals: { game: game }
  end

  def my_games
    search = current_user.games.ransack(params[:q])
    render template: 'games/index', locals: { games: search.result }
  end

  def nearby
    range = params.require(:range)
    lat, lng = params.require(:lat), params.require(:lng)
    render json: GamesLocation.new(range, lat, lng).nearby
  end

  def create
    game = Game.new(permitted_attributes)
    if game.save
      render template: 'games/show', locals: { game: game }
    else
      render json: game.errors, status: :unprocessable_entity
    end
  end

  def update
    game = user_game.find(params[:id])
    if game.update_attributes(permitted_attributes)
      render template: 'games/show', locals: { game: game }
    else
      render json game.errors, status: :unprocessable_entity
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
             :game_kind_id, :theme_id, :user_id,
             photos_attributes: [:id, :photo])
  end

  def user_game
    current_user.games
  end

  def per_page
    params[:per_page] || 10
  end
end
