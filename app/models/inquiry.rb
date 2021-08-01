class Inquiry include ActiveModel::Model #DBをしようしないためActiveModelを使用

  attr_accessor :name, :reply_email, :message #読み取りも書き取りもできるオブジェクトの属性を定義

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :reply_email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :message, :presence => {:message => 'メッセージ内容を入力してください'}
end
