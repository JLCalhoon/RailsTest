class AddReactTrackerToVictories < ActiveRecord::Migration[7.0]
  def change
    add_column :victories, :react_tracker, :string
  end
end
