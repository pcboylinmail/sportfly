class RenameTableNameLiveToLiveShow < ActiveRecord::Migration[5.0]
  def change
    rename_table :lives, :live_shows
  end
end
