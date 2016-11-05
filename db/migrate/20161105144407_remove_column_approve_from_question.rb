class RemoveColumnApproveFromQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :approve
  end
end
