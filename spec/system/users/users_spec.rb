require 'rails_helper'

RSpec.describe 'User_log_in', type: :system do
  before do
    visit new_user_session_path
  end
  describe "ログイン前" do
    context "フォームの入力が正しい"do
      it "ログインが成功"do
        fill_in "メールアドレス", with: 'example@example.com'
        fill_in "パスワード", with: "passward"
        click_button "Login"
        expect(current_path).to eq root_path
      end
    end
  end
end