class CreateRecruitStudentCompanyFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_student_company_favorites do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
