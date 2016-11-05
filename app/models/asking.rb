class Asking < ApplicationRecord
  belongs_to :user
  belongs_to :question, :counter_cache => :users_count
end
