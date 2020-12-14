class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.integer :entry_id
      t.string :title
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end
