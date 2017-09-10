FactoryGirl.define do
  factory :user do
    name  FFaker::Name.first_name
    surname FFaker::Name.last_name
    email FFaker::Internet.email
    identification_document FFaker::IdentificationBR.cpf
    birth_date FFaker::Time.date
    rating { rand(2..10) }
  end
end