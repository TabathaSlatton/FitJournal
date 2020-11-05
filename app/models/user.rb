class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable 
  has_many :daily_journals
      # I've decided to not have a connection from users to meals and workouts for the purpose of this app
        # has_many :meals, through: :daily_journals
        # has_many :workouts, through: :daily_journals

         def self.google_omniauth(auth)
          where(provider: auth["provider"], uid: auth["uid"]).first_or_create(email: auth["info"]["email"]) do |user|
              user.username = auth.info.name
              user.first_name = auth.info.first_name
              user.last_name = auth.info.last_name
              user.profile_img_url = auth.info.image
              user.email = auth.info.email
              user.password = auth.info.first_name
              # user.password = Devise.friendly_token[0,20]
          end
        end

end
