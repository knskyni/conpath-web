class ChangePrimaryKeyToStudents < ActiveRecord::Migration[5.2]
  def change
      change_column :students, :id, :string
  end
end
