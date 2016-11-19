class AddLikesCountToQuestions < ActiveRecord::Migration[5.0]
  def change
  	 add_column :questions, :likes_count, :integer, :default => 0

     Question.pluck(:id).each do |i|
       Question.reset_counters(i, :likes)
     end
  end
end
