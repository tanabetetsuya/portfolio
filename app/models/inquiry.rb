class Inquiry include ActiveModel::Model #DBをしようしないためActiveModelを使用
  #belongs_to :user
  
  attr_accessor :name, :reply_email, :message #読み取りも書き取りもできるオブジェクトの属性を定義
  
  validates :name, :presence => {:message => '名前を入力してください'}
  validates :reply_email, :presence => {:message => 'メールアドレスを入力してください'}
end
