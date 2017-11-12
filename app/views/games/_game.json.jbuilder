json.game do
  json.id           game.id
  json.name         game.name
  json.description  game.description
  json.launch_date  game.launch_date
  json.lifetime     game.lifetime
  json.players      game.players
  json.user_id      game.user_id
  json.game_kind    game.game_kind
  json.category     game.category
  json.price        game.price
  json.photos       game.photos.each(&:url)
end
