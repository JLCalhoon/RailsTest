class AddCrazyToVictories < ActiveRecord::Migration[7.0]
  def change
    add_column :victories, :crazy, :integer
  end
end
