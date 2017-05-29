class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :student_id
      t.string :card_id
      t.string :email

      t.timestamps
    end
  end
end
