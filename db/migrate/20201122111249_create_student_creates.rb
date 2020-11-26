class CreateStudentCreates < ActiveRecord::Migration[5.2]
  def change
    create_table :student_creates do |t|
      t.string :auth_key
      t.string :student_id
      t.string :email

      t.timestamps
    end
  end
end
