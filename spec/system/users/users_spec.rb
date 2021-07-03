require 'rails_helper'

  describe 'ユーザー登録機能' do
    before do
      visit new_user_session_path
    end

    it 'ユーザーが新規作成できる' do
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Passward', with: '01234567'
      find('#Signup-button').click
      expect(current_path).to eq root_path
    end

    it 'ユーザーが新規作成できない' do
      fill_in 'メールアドレス', with: 'example@example.com'
      find('#Signup-button').click
      expect(current_path).to eq new_user_registration_path
    end
  end