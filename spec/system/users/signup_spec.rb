require 'rails_helper'

RSpec.describe 'User_sign_up', type: :system do
    before do
      visit new_user_registration_path
      #User.create(name: 'テストユーザー', email: 'test@test.com', password: "password")
    end
    describe "新規登録前"  do
      it "新規登録が成功" do
        fill_in 'user[name]', with: 'テストユーザー'
        fill_in 'user[email]', with: 'test@testemail.com'
        fill_in 'user[password]', with: '12345678'
        fill_in 'user[password_confirmation]', with: '12345678'
        click_button "Sign up"
        expect(current_path).to eq root_path
      end
      
      it "新規登録が失敗" do
        fill_in 'user[email]', with: 'test@testemail.com'
        fill_in 'user[password]', with: '12345678'
        fill_in 'user[password_confirmation', with: '12345678'
        click_button "Sign up"
        expect(current_path).to eq new_user_registration_path
        expect(page).to have_content "can't be blank"
        end
    end
  end