class RemoveFixColumnViewerProblem < ActiveRecord::Migration[5.0]
  def change
    remove_column :live_shows, :viewer
  end
end
