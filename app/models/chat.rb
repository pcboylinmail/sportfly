class Chat < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :live_show

  # def self.latest_chat
  #   self.where(Time.now)
  # end

  def return_json
    {
      :chat => self,
      :chat_user => self.user
    }
  end
end
