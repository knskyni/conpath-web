class RenameStudentCreatesToStudentTemps < ActiveRecord::Migration[5.2]
  def change
    rename_table :student_creates, :student_temps
  end
end
