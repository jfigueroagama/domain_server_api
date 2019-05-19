# spec/factories/servers.rb
FactoryBot.define do
  factory :server do
    server_name { Faker::Movies::StarWars.character }
  end
end
