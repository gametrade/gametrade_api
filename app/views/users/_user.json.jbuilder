json.user do
  json.name                     user.name
  json.surname                  user.surname
  json.email                    user.email
  json.identification_document  user.identification_document
  json.birth_date               user.birth_date
  json.photo                    user.photo
  json.rating                   user.rating
  json.interests                user.interests

  if user.address
    json.adress do
      json.kind         user.adress.kind
      json.street       user.adress.street
      json.number       user.adress.number
      json.complement   user.adress.complement
      json.zip_code     user.adress.zip_code
      json.neighborhood user.adress.neighborhood
      json.city         user.adress.city
      json.state        user.adress.state
      json.country      user.adress.country
    end
  end
end
