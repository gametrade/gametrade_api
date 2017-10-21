class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    wishlists = current_user.wishlists    
    render template: 'wishlists/index', locals: { wishlists: wishlists }
  end

  def create
    wishlist = current_user.wishlists.create(params.require(:fund_id))
    render template: 'wishlists/show', locals: { wishlist: wishlist }
  end

  def destroy
    wishlist = current_user.wishlists.where(fund_id: params.require(:fund_id))
    wishlist.destroy
    render :index
  end
end
