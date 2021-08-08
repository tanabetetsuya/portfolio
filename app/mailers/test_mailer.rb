class TestMailer < ApplicationMailer
  def send_mail
      mail_info = {
        to: ENV['SEND_MAIL'],
        from: ENV['SEND_MAIL'],
        from_display_name: 'テストユーザー',
        subject: 'テストユーザーです',
        body: '本メールはテストメールです。'
      }

    from = Mail::Address.new mail_info['from']
    from.display_name = mail_info['from_display_name']

    mail(subject: mail_info['subject'], from: from.format, to: mail_info['to']) do |format|
      format.text { render plain: mail_info['body'] }
    end

  end
end

