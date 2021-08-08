FactoryBot.define do
  factory :event do
    title {Faker::Lorem.characters(0..16)}
    body {Faker::Lorem.characters(0..16)}
    start_time {Time.zone.now}
    end_time {Time.zone.now}
    association :user
  end
end