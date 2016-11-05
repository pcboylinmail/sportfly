class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :subject, null: false
      t.integer :user_id
      t.integer :live_id
      t.integer :approve, default: 0
      t.timestamps
    end
    add_index :questions, :user_id
    add_index :questions, :live_id
  end
end
