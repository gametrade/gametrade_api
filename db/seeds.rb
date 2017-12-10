require 'factory_bot_rails'

0.upto(50) do
  address = FactoryBot.create(:address)
  FactoryBot.create(:user, address: address)
end

0.upto(10) do
  FactoryBot.create(:theme)
  FactoryBot.create(:game_kind)
end

User.all.each do |user|
  FactoryBot.create(:game, user: user,
         theme_id: Theme.all.sample.id,
         game_kind: GameKind.all.sample)
end
