class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter, :facebook, :google_oauth2]

        validates :name, presence: true
        validates :email, presence: true


        has_many :events, dependent: :destroy
        has_many :comments, dependent: :destroy
        has_many :likes, dependent: :destroy
        has_many :liked_exercise_menus, through: :likes, source: :exercise_menu
        has_many :exercise_menus, dependent: :destroy
        has_many :exercise_suggestions, dependent: :destroy
        has_many :sns_credentials, dependent: :destroy
        attachment :profile_image

        enum is_valid: {有効: true, 退会: false}

  #def active_for_authentication?
    # super && (self.is_valid === "有効")
  #end



  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          name: auth.info.name,
          email: auth.info.email,
          password: Devise.friendly_token.first(7),
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
  end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        name: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token.first(7),
        profile_image: auth.info.image,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
   end
end
