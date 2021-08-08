require 'rails_helper'

RSpec.describe 'inquiryモデル', type: :system do
  let(:user) { create(:user) }
  #Inquiry.create(name: 'テストユーザー', reply_email: 'test@test.com', message: 'お問い合わせ')
  describe 'ログイン前' do
    context 'inquiry index画面へ遷移' do
      it '遷移は失敗する' do
        visit inquiries_path
        expect(current_path).to eq new_user_session_path
      end
    end
    context 'お問い合わせリンクをクリックでinquiry index画面へ遷移' do
      it '遷移は失敗する' do
        visit new_user_session_path
        click_link 'お問い合わせ'
        expect(current_path).to eq new_user_session_path
      end
    end
  end
  describe 'ログイン後' do
    before do
      login(user)
    end
    context 'inquiry index画面へ遷移' do
      it '遷移は成功する' do
        visit inquiries_path
        expect(current_path).to eq inquiries_path
        expect(page).to have_content '名前'
      end
    end
    context 'お問い合わせボタンをクリック' do
      it '遷移は成功する' do
        click_link 'お問い合わせ'
        expect(current_path).to eq inquiries_path
        expect(page).to have_content '名前'
        expect(page).to have_content 'メールアドレス'
        expect(page).to have_content 'お問い合わせ内容'
      end
    end
  end
 end