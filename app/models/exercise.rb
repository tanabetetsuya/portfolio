class Exercise < ApplicationRecord
  has_many :exercise_suggestions, dependent: :destroy
  has_many :today_exercises, dependent: :destroy
end
