class CreateUserQuestionships < ActiveRecord::Migration[5.0]
  def change
    create_table :askings do |t|
      t.integer :user_id
      t.integer :question_id
      t.timestamps
    end
    add_index :askings, :user_id
    add_index :askings, :question_id
    add_column :questions, :users_count, :integer, :default => 0

    Question.pluck(:id).each do |i|
      Question.reset_counters(i, :users) # 全部重算一次
    end
  end
end
