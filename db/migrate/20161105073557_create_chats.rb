class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text :content, null: false
      t.integer :user_id
      t.integer :live_id
      t.timestamps
    end
    add_index :chats, :user_id
    add_index :chats, :live_id
  end
end
