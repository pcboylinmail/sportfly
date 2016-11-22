class Question < ApplicationRecord
  validates_presence_of :subject
  has_many :askings
  has_many :asked_users,:through => :askings, :source => :user
  has_many :users, :through => :askings
  belongs_to :user
  belongs_to :live_show

  def return_json
    {
      :question => self,
      :question_user => self.user
    }
  end
end
