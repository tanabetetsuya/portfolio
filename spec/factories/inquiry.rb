FactoryBot.define do
  factory :inquiry do
    name          { Faker::Name.name }
    reply_email   { Faker::Internet.email }
    message       { Faker::Lorem.characters(0..16) }
  end
end