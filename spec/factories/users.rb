FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: rand(6..12)) + rand(0..9).to_s + ('a'..'z').to_a.sample }
    password_confirmation { password }
    last_name             { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    last_name_ruby        { Faker::Japanese::Name.last_name.yomi }
    first_name_ruby       { Faker::Japanese::Name.first_name.yomi }
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
