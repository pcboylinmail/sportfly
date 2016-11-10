class LiveShow < ApplicationRecord
  belongs_to :user
  has_many :chats
  has_many :questions
  has_many :watchings
  has_many :watchers, :through => :watchings, :source => :user

  def return_json
    return {
      :name => self.name
    }
  end
end
