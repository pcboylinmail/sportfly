class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :followings
  has_many :followers, :through => :followings
  has_many :live_shows, :class_name => "Live" , :foreign_key => "user_id"
  has_many :chats
  has_many :askings, :dependent => :destroy
  has_many :questions, :through => :askings
  has_many :watchings
  has_many :watch_lives, :through => :watchings, :source => :live

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      #user.fb_raw_data = auth
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
     existing_user.fb_uid = auth.uid
     existing_user.fb_token = auth.credentials.token
     #existing_user.fb_raw_data = auth
     existing_user.save!
     return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.fb_name = auth.info.name
    user.fb_image = auth.info.image
    user.fb_link = auth.extra.raw_info.link
    user.gender = auth.extra.raw_info.gender
    user.password = Devise.friendly_token[0,20]
    #user.fb_raw_data = auth
    user.save!
    return user
  end

    def return_json
    return {
      :email => self.email,
      :fb_token => self.fb_token,
      :fb_name => self.fb_name,
      :gender => self.gender,

    }
  end
end
