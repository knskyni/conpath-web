class AddTeacherCommentToRecruitCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :recruit_companies, :teacher_comment, :string, after: :recruit_url
  end
end
