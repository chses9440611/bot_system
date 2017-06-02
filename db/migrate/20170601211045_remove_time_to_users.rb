class RemoveTimeToUsers < ActiveRecord::Migration[5.0]
  def change
	  change_column :users, :book_wait_time, :datetime
	  change_column :users, :start_wait_time, :datetime
	  change_column :users, :start_time, :datetime
	  change_column :users, :end_time, :datetime
  end
end
