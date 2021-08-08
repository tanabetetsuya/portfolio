require 'rails_helper'

RSpec.describe Comment, type: :system do
  let(:exercise_menu) { create(:exercise_menu) }
  let(:user) { create(:user) }
  let(:comment) { create(:comment) }
  before do
    visit new_user_session_path
  end
  describe 'ログイン前' do
    context 'comment index画面へ遷移' do
      it '遷移は失敗する' do
        visit exercise_menu_comments_path(exercise_menu.id)
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
        expect(current_path).to eq new_user_session_path
      end
    end
  end
  describe 'ログイン後' do
   before do
     login(user)
    end
    context 'コメント一覧画面へ遷移' do
      it '遷移は成功' do
        visit exercise_menu_comments_path(exercise_menu.id)
        expect(current_path).to eq exercise_menu_comments_path(exercise_menu.id)
      end
    end
    context '入力処理テスト' do
      it 'コメント作成が成功' do
        visit exercise_menu_comments_path(exercise_menu.id)
        fill_in "comment[comment]", with: 'テスト'
        click_button '送信'
        expect(page).to have_content user.name
        expect(page).to have_content comment.created_at.strftime('%Y/%m/%d')
        expect(page).to have_content 'テスト'
        expect(current_path).to eq exercise_menu_comments_path(exercise_menu.id)
      end
    end
  end
end