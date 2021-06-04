class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  has_many :comments
  has_many :obstacles
  has_many :spots, :through => :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
      
            if auth.info.username
              user.name = auth.info.username
            else
              user.name = auth.info.name
            end
            
            user.password = Devise.friendly_token[0,20]
          end
        end

end
