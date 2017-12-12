json.game do
  json.id           game.id
  json.name         game.name
  json.description  game.description
  json.launch_date  game.launch_date
  json.lifetime     game.lifetime
  json.players      game.players
  json.user         game.user
  json.game_kind    game.game_kind
  json.theme        game.theme
  json.price        game.price
  json.created_at   game.updated_at
  json.updated_at   game.updated_at

  if game.photos
    json.photos do
      json.array! game.photos do |item|
        json.id item.id
        json.photo item.photo.url
      end
    end
  end
end

