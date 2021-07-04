class ExerciseMenu < ApplicationRecord
  belongs_to :user
  has_many :today_exercises, dependent: :destroy
end
