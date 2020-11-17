class CreateRecruitJobCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_job_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
