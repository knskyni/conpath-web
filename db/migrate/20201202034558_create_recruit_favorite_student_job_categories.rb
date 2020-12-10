class CreateRecruitFavoriteStudentJobCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_favorite_student_job_categories do |t|
      t.string :student_id
      t.integer :job_category_id

      t.timestamps
    end
  end
end
