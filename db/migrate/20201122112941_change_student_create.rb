class ChangeStudentCreate < ActiveRecord::Migration[5.2]
  def change
    remove_column :student_creates, :email
    add_column :student_creates, :class_id, :integer, after: :id
    change_column :student_creates, :auth_key, :string, after: :student_id
  end
end
