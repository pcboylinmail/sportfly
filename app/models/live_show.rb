class LiveShow < ApplicationRecord
  belongs_to :user
  has_many :chats
  has_many :questions
  has_many :watchings
  has_many :watchers, :through => :watchings, :source => :user

  def return_json
    {
      :live_show => self,
      :user => self.user
    }
  end
end
