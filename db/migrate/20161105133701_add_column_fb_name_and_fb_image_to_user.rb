class AddColumnFbNameAndFbImageToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fb_name, :string
    add_column :users, :fb_image, :string
    add_column :users, :fb_link, :string
    add_column :users, :gender, :string
  end
end
