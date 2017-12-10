require 'ffaker'

FactoryBot.define do
  factory :address do
    kind 'Rua'
    country FFaker::Address.country
    state FFaker::AddressBR.state
    city FFaker::AddressBR.city
    neighborhood FFaker::Address.neighborhood
    street FFaker::Address.street_name
    number FFaker::Address.building_number
    zip_code FFaker::AddressBR.zip_code
    user
  end

  factory :theme do
    sequence(:name) { |n| n.to_s + FFaker::BaconIpsum.word }
  end

  factory :game do
    sequence(:name) { |n| n.to_s + FFaker::BaconIpsum.word }
    description FFaker::Lorem.paragraph
    players { rand(2..10) }
    launch_date FFaker::Time.date
    lifetime FFaker::Time.date
    user
    game_kind
    theme
  end

  factory :game_kind do
    sequence(:name) { |n| n.to_s + FFaker::BaconIpsum.word }
  end

  factory :user do
    sequence(:name) { |n| n.to_s + FFaker::NameBR.name }
    password 'password123'
    surname FFaker::Name.last_name
    sequence(:email) { |n| n.to_s + FFaker::Internet.email }
    identification_document FFaker::IdentificationBR.cpf
    birth_date FFaker::Time.date
    rating { rand(2..10) }
    contact FFaker::PhoneNumberBR.mobile_phone_number
  end

  factory :wishlist do
    user
    game
  end
end
