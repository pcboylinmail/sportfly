class CreateWatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :watchings do |t|
      t.integer :user_id
      t.integer :live_id
      t.timestamps
    end
  add_index :watchings, :user_id
  add_index :watchings, :live_id
  end
end
