class RemoveLikesCountOfChatAndQuestions < ActiveRecord::Migration[5.0]
  def change
  	remove_column :chats, :like_count
  	remove_column :questions, :likes_count
  end
end
