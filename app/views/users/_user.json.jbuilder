json.user do
  json.id                       user.id
  json.name                     user.name
  json.surname                  user.surname
  json.email                    user.email
  json.identification_document  user.identification_document
  json.birth_date               user.birth_date
  json.rating                   user.rating
  json.interests                user.interests
  json.photo                    user.photo.url if user.photo

  if user.address
    json.address do
      json.kind         user.address.kind
      json.street       user.address.street
      json.number       user.address.number
      json.complement   user.address.complement
      json.zip_code     user.address.zip_code
      json.neighborhood user.address.neighborhood
      json.city         user.address.city
      json.state        user.address.state
      json.country      user.address.country
      json.lat          user.address.lat
      json.lng          user.address.lng
    end
  end
end

