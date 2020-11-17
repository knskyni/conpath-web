class AddGenderToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :gender, :integer, after: :class_id
  end
end
