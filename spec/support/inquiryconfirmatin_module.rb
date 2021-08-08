module InquiryConfirmationModule
  def inquiryconfirmation(inquiry)
    visit inquiries_path
    fill_in "inquiry[name]", with: 'テストユーザー'
    fill_in "inquiry[reply_email]", with: 'test@test.com'
    fill_in "inquiry[message]", with: 'お問い合わせ'
    clink_link '確認'
  end
end
    