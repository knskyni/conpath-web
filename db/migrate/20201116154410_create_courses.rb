class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :school_id
      t.string :name
      t.integer :number_of_enrolled_year

      t.timestamps
    end
  end
end
