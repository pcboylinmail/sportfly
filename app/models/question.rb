class Question < ApplicationRecord
  validates_presence_of :subject
  belongs_to :user
  belongs_to :live
end
