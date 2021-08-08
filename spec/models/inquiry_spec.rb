require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'Inquiryモデル' do

    it 'name email messageがあれば有効' do
      expect(FactoryBot.build(:inquiry)).to be_valid
    end

    it 'nameがなければ無効' do
      inquiry = FactoryBot.build(:inquiry, name: nil)
      expect(inquiry).to be_invalid
      expect(inquiry.errors[:name]).to include('名前を入力してください')
    end

    it 'emailがなければ無効' do
      inquiry = FactoryBot.build(:inquiry, reply_email: nil)
      expect(inquiry).to be_invalid
      expect(inquiry.errors[:reply_email]).to include('メールアドレスを入力してください')
    end

    it 'messageがなければ無効' do
      inquiry = FactoryBot.build(:inquiry, message: nil)
      expect(inquiry).to be_invalid
      expect(inquiry.errors[:message]).to include('メッセージ内容を入力してください')
    end
  end
end