class InquiryMailer < ApplicationMailer
  default from: ENV['SEND_MAIL'] #送信元のメールアドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.reply_email, :subject => 'お問い合わせを承りました')
  end
end
