class AddClassToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :class_id, :integer, after: :first_name_furigana
  end
end
