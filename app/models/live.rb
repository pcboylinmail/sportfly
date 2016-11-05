class Live < ApplicationRecord
  belongs_to :user
  has_many :chats
  has_many :questions
end
