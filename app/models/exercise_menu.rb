class ExerciseMenu < ApplicationRecord
  belongs_to :user
  has_many :today_exercises, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user #中間テーブル'likes'を経由して関連先の'user'モデルを取得

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
