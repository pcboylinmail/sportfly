class AddColumnUserIdToLive < ActiveRecord::Migration[5.0]
  def change
    add_column :lives, :user_id, :integer
    add_index :lives, :user_id
  end
end
