require 'rails_helper'

RSpec.describe ExerciseMenu, type: :model do

  describe 'ExerciseMenuモデル' do
    it '運動目的、運動目標があれば有効' do
      expect(FactoryBot.build(:exercise_menu)).to be_valid
    end

    it '運動目的が空欄では無効' do
      exercise_menu = FactoryBot.build(:exercise_menu, exercise_purpose: nil)
      expect(exercise_menu).to be_invalid
      expect(exercise_menu.errors[:exercise_purpose]).to include("can't be blank")
    end
  end
end