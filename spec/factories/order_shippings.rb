FactoryBot.define do
  factory :order_shipping do
    token           { "tok_#{Faker::Lorem.characters(number: 28)}" }
    postal_code     { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    municipalities  { Faker::Address.city }
    house_number    { Faker::Address.street_address }
    building_name   { Faker::Address.secondary_address }
    phone_number    { Faker::Number.number(digits: 10) }
  end
end
