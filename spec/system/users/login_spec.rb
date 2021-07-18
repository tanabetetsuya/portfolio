require 'rails_helper'

RSpec.describe 'User_log_in', type: :system do
  before do
    visit new_user_session_path
    User.create(email: 'example@example.com', password: "password")
    #let(:user) {create(:user)}
  end
  describe "ログイン前" do
    context "フォームの入力が正しい"do
      it "ログインが成功"do
        fill_in "user[email]", with: 'example@example.com'
        fill_in "user[password]", with: "password"
        click_button "Log in"
        expect(current_path).to eq root_path
      end
    end
  end
end