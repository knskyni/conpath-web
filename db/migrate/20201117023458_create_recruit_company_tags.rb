class CreateRecruitCompanyTags < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_company_tags do |t|
      t.string :name

      t.timestamps
    end
  end
  def tag
    return RecruitCompanyTag.find_by(id: self.tag_id)
  end
end
