class RemoveGradeFromSchoolClass < ActiveRecord::Migration[5.2]
  def change
    remove_column :school_classes, :grade, :integer
  end
end
