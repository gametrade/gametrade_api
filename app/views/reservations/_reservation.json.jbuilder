json.reservation do
  json.start_date reservation.start_date
  json.end_date reservation.end_date
  json.value reservation.value

  json.user do
    json.id      reservation.user.id
    json.name    reservation.user.name
    json.surname reservation.user.surname
    json.email   reservation.user.email
  end

  json.game do
    json.id           reservation.game.id
    json.name         reservation.game.name
    json.description  reservation.game.description
    json.launch_date  reservation.game.launch_date
    json.lifetime     reservation.game.lifetime
    json.players      reservation.game.players
    json.price        reservation.game.price
  end
end