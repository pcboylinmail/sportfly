class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :followings
  has_many :followers, :through => :followings
  has_many :lives
  #has_many :followings, :class_name => 'Following', :foreign_key => 'follower_id'
end
