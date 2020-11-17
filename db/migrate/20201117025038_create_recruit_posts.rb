class CreateRecruitPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_posts do |t|
      t.string :recruit_code
      t.integer :company_id
      t.integer :year
      t.integer :job_category_id
      t.string :job_description
      t.integer :recruitment_numbers
      t.text :working_office
      t.integer :status
      t.integer :employment_status
      t.string :employment_status_other
      t.integer :salary_2year
      t.integer :salary_3year
      t.integer :salary_4year
      t.text :apply_method
      t.string :submit_document
      t.text :other_description

      t.timestamps
    end
  end
end
