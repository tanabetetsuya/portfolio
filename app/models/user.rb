class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inquiries, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :exercise_menus, dependent: :destroy
  has_many :exercise_suggestions, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
