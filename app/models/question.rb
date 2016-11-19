class Question < ApplicationRecord
  validates_presence_of :subject
  has_many :askings, :dependent => :destroy
  has_many :users, :through => :askings
  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user
  belongs_to :user
  belongs_to :live_show

  def return_json
    {
      :question => self,
      :question_user => self.user
    }
  end
end
