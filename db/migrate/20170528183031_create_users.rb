class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :student_id
      t.boolean :book_flag
      t.boolean :check_flag
      t.boolean :start_flag
      t.boolean :finished_flag
      t.time :book_wait_time
      t.time :start_wait_time
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
