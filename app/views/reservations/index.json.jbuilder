json.my_reservations do
  json.array! my_reservations, partial: 'reservations/reservation',
              as: :reservation
end

json.my_requests do
  json.array! my_requests, partial: 'reservations/reservation', as: :reservation
end
