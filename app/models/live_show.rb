class LiveShow < ApplicationRecord
  belongs_to :user
  has_many :chats
  has_many :questions
  has_many :watchings
  has_many :watchers, :through => :watchings, :source => :user

  def return_json
    {
      :live_show => self,
      :live_show_user => self.user,
      :live_show_chats => self.chats,
      :live_show_questions => self.questions,
      :live_show_watchers => self.watchers,
      :user_followers_count => self.user.followers.count
    }
  end
end
