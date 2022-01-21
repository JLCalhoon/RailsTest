class AddThumbToVictories < ActiveRecord::Migration[7.0]
  def change
    add_column :victories, :thumb, :integer
  end
end
