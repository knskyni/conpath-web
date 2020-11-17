class CreateRecruitCompanyTags < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_company_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
