class AddCardidToUsers < ActiveRecord::Migration[5.0]
  def change
	  add_column :users, :card_id, :string
  end
end
