json.wishlist do
  json.id      wishlist.id
  json.partial! 'users/user', user: wishlist.user
  json.partial! 'games/game', game: wishlist.game
end
