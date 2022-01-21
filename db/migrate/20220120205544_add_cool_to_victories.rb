class AddCoolToVictories < ActiveRecord::Migration[7.0]
  def change
    add_column :victories, :cool, :integer
  end
end
