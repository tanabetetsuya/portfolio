require 'rails_helper'

RSpec.describe 'ExerciseMenu', type: :system do
  let(:user) { create(:user) }
  describe 'ログイン前' do
    before do
      new_user_session_path
    end
    context 'exercise_menu new画面へ遷移' do
      it '遷移は失敗する' do
        visit new_exercise_menu_path
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
    context 'exercise_menu index画面へ遷移' do
      it '遷移は失敗する' do
        visit exercise_menus_path
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
  end
  describe 'ログイン後' do
    before do
      login(user)
    end
    context '運動メニューの入力項目を入力' do
      it '確認画面へ遷移' do
        visit new_exercise_menu_path
        fill_in "exercise_menu[exercise_purpose]", with: 'テスト'
        fill_in "exercise_menu[exercise_goal]", with: 'テスト'
        click_button '登録'
        expect(current_path).to eq confirmation_path
        expect(page).to have_button '登録'
        click_button '登録'
        expect(current_path).to eq exercise_menus_path
      end
    end
  end
end
