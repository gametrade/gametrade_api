FactoryGirl.define do
  factory :address do
    kind 'Rua'
    country FFaker::Address.country
    state FFaker::AddressBR.state
    city FFaker::AddressBR.city
    neighborhood FFaker::Address.neighborhood
    street FFaker::Address.street_name
    number FFaker::Address.building_number
    zip_code FFaker::AddressBR.zip_code
    latitude FFaker::Geolocation.lat
    longitude FFaker::Geolocation.lng
    user
  end

  factory :category do
    name 'rpg'
  end

  factory :game do
    name 'Dungeons & Dragons'
    description FFaker::Lorem.paragraph
    players { rand(2..10) }
    launch_date FFaker::Time.date
    lifetime FFaker::Time.date
    user
    game_kind
    category
  end

  factory :game_kind do
    name 'board'
  end

  factory :user do
    name  FFaker::Name.first_name
    password 'password123'
    surname FFaker::Name.last_name
    email FFaker::Internet.email
    identification_document FFaker::IdentificationBR.cpf
    birth_date FFaker::Time.date
    rating { rand(2..10) }
  end

  factory :wishlist do
    user
    game
  end
end
