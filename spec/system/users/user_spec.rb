require 'rails_helper'

RSpec.describe 'User', type: :system do
  let(:user) { create(:user, name: 'テストユーザー', email: 'test@test.com', password: 'password', password_confirmation: 'password', profile_image: 'box1.jpg') }
  before do
    visit new_user_session_path
  end
  describe 'ログイン前' do
    context 'user showページへ遷移' do
      it '遷移は失敗' do
        visit user_path(user)
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
    context 'user editページへ遷移' do
      it '遷移は失敗' do
        visit edit_user_path(user)
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
  end
  describe 'ログイン後' do
    before do
      login(user)
    end
    context 'マイページボタンをクリック' do
      it '遷移は成功' do
        visit exercise_menus_path
        click_link 'マイページ'
        expect(current_path).to eq user_path(user)
        expect(page).to have_content user.name
        expect(page).to have_content user.email
        expect(page).to have_link '編集する'
        expect(page).to have_link 'カレンダーへ'
      end
    end
    context 'マイページから編集ボタンをクリック' do
      it '遷移は成功する' do
        visit user_path(user)
        click_link '編集する'
        expect(current_path).to eq edit_user_path(user)
        expect(page).to have_field 'user[name]', with: 'テストユーザー'
        expect(page).to have_field 'user[email]', with: 'test@test.com'
        expect(page).to have_button '登録'
      end
    end
    context 'ユーザー編集ページの内容を編集して登録' do
      it '登録は成功し、画面が遷移' do
        visit edit_user_path(user)
        fill_in "user[name]", with: 'テストユーザー2'
        fill_in "user[email]", with: 'test2@test.com'
        attach_file 'user[profile_image]', "#{Rails.root}/spec/factories/image/box1.jpg"
        click_button '登録'
        expect(current_path).to eq user_path(user)
        expect(page).to have_content 'テストユーザー2'
        expect(page).to have_content 'test2@test.com'
      end
    end
  end
end