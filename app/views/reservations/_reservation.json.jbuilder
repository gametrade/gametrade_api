json.reservation do
  json.id         reservation.id
  json.start_date reservation.start_date
  json.end_date   reservation.end_date
  json.value      reservation.value
  json.status     reservation.status

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
    json.players      reservation.game.players
    json.price        reservation.game.price
  end
end
