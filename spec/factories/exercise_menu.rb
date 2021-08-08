FactoryBot.define do
  factory :exercise_menu do
    exercise_purpose { Faker::Lorem.characters(0..16) }
    exercise_goal { Faker::Lorem.characters(0..16) }
    association :user
  end
end