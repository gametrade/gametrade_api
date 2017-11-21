require 'factory_girl_rails'

0.upto(50) do
  address = FactoryGirl.create(:address)
  FactoryGirl.create(:user, address: address)
end

0.upto(10) do
  FactoryGirl.create(:category)
  FactoryGirl.create(:game_kind)
end

User.all.each do |user|
  FactoryGirl.create(:game, user: user,
         category: Category.all.sample,
         game_kind: GameKind.all.sample)
end
