class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :student_id
      t.integer :company_id
      t.integer :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
