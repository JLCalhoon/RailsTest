class AddHeartToVictories < ActiveRecord::Migration[7.0]
  def change
    add_column :victories, :heart, :integer
  end
end
