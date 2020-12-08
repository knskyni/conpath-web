class CreateRecruitFavoriteStudentIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_favorite_student_industries do |t|
      t.string :student_id
      t.integer :industry_id

      t.timestamps
    end
  end
end
