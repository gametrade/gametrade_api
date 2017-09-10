FactoryGirl.define do
  factory :game do
    name 'Dungeons & Dragons'
    description FFaker::Lorem.paragraph
    players { rand(2..10) }
    launch_date FFaker::Time.date
    lifetime launch_date + 1.days
  end
end