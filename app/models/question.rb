class Question < ApplicationRecord
  validates_presence_of :subject
  has_many :askings, :dependent => :destroy
  has_many :users, :through => :askings
  belongs_to :live_show

  def return_json
    {
      :question => self,
      :question_user => self.users
    }
  end
end
