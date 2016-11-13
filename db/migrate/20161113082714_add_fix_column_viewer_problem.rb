class AddFixColumnViewerProblem < ActiveRecord::Migration[5.0]
  def change
    add_column :live_shows, :viewer, :integer
  end
end
