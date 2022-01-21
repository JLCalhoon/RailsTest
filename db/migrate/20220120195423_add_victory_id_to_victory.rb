class AddVictoryIdToVictory < ActiveRecord::Migration[7.0]
  def change
    add_column :victories, :victory_id, :integer
    add_index :victories, :victory_id
  end
end
