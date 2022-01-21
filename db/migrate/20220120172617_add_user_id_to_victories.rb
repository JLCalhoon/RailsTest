class AddUserIdToVictories < ActiveRecord::Migration[7.0]
  def change
    add_column :victories, :user_id, :integer
    add_index :victories, :user_id
  end
end
