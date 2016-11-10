class Chat < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :live_show

  def return_json
    {
      :chat => self,
      :chat_user => self.user
    }
  end
end
