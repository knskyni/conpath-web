class CreateRecruitCompanyTagAssigns < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_company_tag_assigns do |t|
      t.integer :company_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
