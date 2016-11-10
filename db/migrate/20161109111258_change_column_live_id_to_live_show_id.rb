class ChangeColumnLiveIdToLiveShowId < ActiveRecord::Migration[5.0]
  def change
    rename_column :chats, :live_id, :live_show_id
    rename_column :questions, :live_id, :live_show_id
    rename_column :watchings, :live_id, :live_show_id
  end
end
