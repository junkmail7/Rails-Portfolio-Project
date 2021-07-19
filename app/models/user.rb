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
            
            user.password = Devise.friendly_token[0,20]
          end
        end

  scope :with_most_comments, -> {  joins(:comments).select('user_id, count(user_id) as count').group(:user_id).order('count desc').first }

end
