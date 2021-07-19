require 'rails_helper'

RSpec.describe User, type: :model do
  #let(:user) {create(:user)}
  describe 'Userモデル' do
    it 'name email password confirmation-passwordがあれば有効' do
      expect(FactoryBot.build(:user)).to be_valid
    end
    
    it 'nameがなければ無効' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).to be_invalid
      expect(user.errors[:name]).to include("can't be blank")
    end
    
    it 'emailがなければ無効' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it 'passwordがなければ無効' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end