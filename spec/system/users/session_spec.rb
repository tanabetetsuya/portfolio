require 'rails_helper'

RSpec.describe 'User_log_in', type: :system do
  let(:user) {create(:user)}
  describe "ログイン前" do
    context "フォームの入力が正しい"do
      it "ログインが成功"do
        visit new_user_session_path
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: "password"
        click_button "Log in"
        expect(page).to have_content 'Signed in successfully.'
        expect(current_path).to eq exercise_menus_path
      end
    end
    
    context "emailが空欄" do
      it "ログインが失敗" do
        visit new_user_session_path
        fill_in "user[email]", with: ""
        fill_in "user[password]", with: "password"
        click_button "Log in"
        expect(page).to have_content 'Invalid Email or password.'
        expect(current_path).to eq new_user_session_path
      end
    end  
  
    
    context "passwordが空欄" do
      it "ログインが失敗" do
        visit new_user_session_path
        fill_in "user[email]", with: 'example@example.com'
        fill_in "user[password]", with: ""
        click_button "Log in"
        expect(page).to have_content 'Invalid Email or password.'
        expect(current_path).to eq new_user_session_path
      end
    end
  end  
 
    describe "ログイン後" do
      context "ログアウトボタンをクリック" do
        it "ログアウトが成功する" do
          login(user)
          click_link "ログアウト"
          expect(page).to have_content 'Signed out successfully.'
          expect(current_path).to eq root_path
        end
      end
    end
  end
