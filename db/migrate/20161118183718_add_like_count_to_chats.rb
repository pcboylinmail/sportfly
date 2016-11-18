class AddLikeCountToChats < ActiveRecord::Migration[5.0]
  def change
  	add_column :chats, :like_count, :integer, :default => 0

	Chat.pluck(:id).each do |i|
	  Chat.reset_counters(i, :likes)
	end
  end
end
