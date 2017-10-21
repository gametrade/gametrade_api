class GameKindsController < ApplicationController
  def index
    search = GameKind.ransack(params[:q])
    render template: 'game_kinds/index', locals: { game_kinds: search.result }
  end

  def show
    game_kind = GameKind.find(params.require(:id))
    render template: 'game_kinds/show', locals: { game_kind: game_kind }
  end
end
