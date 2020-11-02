class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  def self.from_omniauth(auth)
    binding.pry
    where(email: auth.info.email).first_or_initialize do |user|
      binding.pry
      user.user_name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
