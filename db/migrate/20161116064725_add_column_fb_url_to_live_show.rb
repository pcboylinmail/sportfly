class AddColumnFbUrlToLiveShow < ActiveRecord::Migration[5.0]
  def change
    add_column :live_shows, :fb_url, :string
  end
end
