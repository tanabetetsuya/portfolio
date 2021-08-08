require 'rails_helper'

RSpec.describe 'Event', type: :system do
  let(:user) { create(:user) }
  let(:event) { create(:event) }
  describe 'ログイン前' do
    context 'event一覧画面へ遷移' do
      it '遷移に失敗する' do
        visit events_path
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
    context 'event詳細画面へ遷移' do
      it '遷移に失敗する' do
        visit new_event_path
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
    context 'event作成画面へ遷移' do
      it '遷移に失敗する' do
        event = build_stubbed(:event)
        visit event_path(event)
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end

  describe 'ログイン後' do
    before do
      login(user)
    end
    context 'event一覧ページへ' do
      it '表示の確認' do
        visit events_path
        expect(page).to have_content 'NEW EVENT'
      end
      it 'event作成画面へ遷移' do
        visit events_path
        click_link 'NEW EVENT'
        expect(current_path).to eq new_event_path
      end
    end
    context 'event作成画面へ' do
      it '表示の確認 タイトルと登録ボタンが表示されているか' do
        visit new_event_path
        expect(page).to have_content 'スケジュール作成'
        expect(page).to have_button '登録'
      end
    end
    context '入力処理のテスト' do
      it '入力処理後のリダイレクト先は正しいか' do
        visit new_event_path
        fill_in 'event[title]', with: 'イベントタイトル'
        fill_in 'event[body]', with: 'イベントボディ'
        click_button '登録'
        expect(current_path).to eq events_path
      end
    end
   end
  end
end


