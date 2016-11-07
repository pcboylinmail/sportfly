class Live < ApplicationRecord
  belongs_to :user
  has_many :chats
  has_many :questions

  def return_json
    return {
      :name => self.name
    }
  end
end
