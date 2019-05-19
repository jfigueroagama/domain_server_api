# spec/factories/addresses.rb
FactoryBot.define do
  factory :address do
    ip_address { "10.10.10.0" }
  end
end
