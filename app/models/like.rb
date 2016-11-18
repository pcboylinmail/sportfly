class Like < ApplicationRecord
	belongs_to :chat, :counter_cache => true
	belongs_to :user
end
