class Question < ApplicationRecord
  validates_presence_of :subject
  has_many :askings, :dependent => :destroy
  has_many :users, :through => :askings
  belongs_to :live
end
