class CreateSchoolClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :school_classes do |t|
      t.integer :begin_year
      t.integer :course_id
      t.integer :grade
      t.string :class

      t.timestamps
    end
  end
end
