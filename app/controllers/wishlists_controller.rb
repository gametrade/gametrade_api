class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    wishlists = current_user.wishlists
    render template: 'wishlists/index', locals: { wishlists: wishlists }
  end

  def create
    wishlist = Wishlist.create({ user_id: current_user.id, game_id: params.require(:game_id) })
    render template: 'wishlists/show', locals: { wishlist: wishlist }
  end

  def destroy
    wishlist = current_user.wishlists.find(params.require(:id))
    wishlist.destroy
    render :index
  end
end
