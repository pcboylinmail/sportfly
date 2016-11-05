class Chat < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :live
end
