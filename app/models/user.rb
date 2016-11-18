class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :generate_authentication_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :followings
  has_many :followers, :through => :followings
  has_many :live_shows
  has_many :chats, dependent: :destroy
  has_many :questions
  has_many :askings, :dependent => :destroy
  has_many :wonder_questions, :through => :askings, :source => :question
  has_many :watchings
  has_many :watch_lives, :through => :watchings, :source => :live_show

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://s2.post01.com/uploads/c4/b/119050/14689381446338.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  def generate_authentication_token
     self.authentication_token = Devise.friendly_token
  end

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

  def self.get_fb_data(access_token)
    #res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token } }
    res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token, :fields => "id,name,email,picture,link,gender" } }
    if res.code == 200
      JSON.parse( res.to_str )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end

  def return_json
    return {
      :user => self,
      :user_live_shows => self.live_shows,
      #:user_followers => self.followers,
      :user_followings => Following.where(follower_id: self.id)
    }
  end
end
