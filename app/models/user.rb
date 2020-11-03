class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]

  
  # def self.from_omniauth(auth)
  #   where(email: auth.info.email).first_or_initialize do |user|
  #     user.username = auth.info.name
  #     user.first_name = auth.info.first_name
  #     user.last_name = auth.info.last_name
  #     user.profile_img_url = auth.info.image
  #     user.email = auth.info.email
  #     user.password = SecureRandom.hex
  #     # user.save
  #   end
  # end
end
