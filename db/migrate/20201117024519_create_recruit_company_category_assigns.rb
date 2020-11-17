class CreateRecruitCompanyCategoryAssigns < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_company_category_assigns do |t|
      t.integer :company_id
      t.integer :company_category_id

      t.timestamps
    end
  end
end
