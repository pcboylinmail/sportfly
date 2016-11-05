class CreateFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.integer :user_id
      t.integer :follower_id

      t.timestamps
    end
      add_index :following, :user_id
      add_index :following, :follower_id
  end
end
