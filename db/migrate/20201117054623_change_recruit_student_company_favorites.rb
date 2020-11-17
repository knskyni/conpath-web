class ChangeRecruitStudentCompanyFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :recruit_student_company_favorites, :user_id, :student_id
    change_column :recruit_student_company_favorites, :student_id, :string
  end
end
