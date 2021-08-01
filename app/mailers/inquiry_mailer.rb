class InquiryMailer < ApplicationMailer
  default from: ENV['SEND_MAIL'] #送信元のメールアドレス
  default to: ENV['SEND_MAIL']#送信先のメールアドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました')
  end
end
