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

    it 'emailが重複していれば無効' do
      user1 = User.create(name: 'sample', email: 'sample@sample.com', password: "password", password_confirmation: "password")
      user2 = FactoryBot.build(:user, email: 'sample@sample.com')
      user2.email = user1.email
      expect(user2).to be_invalid
      expect(user2.errors[:email]).to include("has already been taken")
    end

    it 'passwordが６文字未満の場合無効' do
      user = FactoryBot.build(:user)
      user.password = "a" * 5
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it 'passwordとpassword_confirmationが一致しない場合無効' do
      user = build(:user, password_confirmation: "")
      expect(user).to be_invalid
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end