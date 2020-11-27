class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :email
      t.string :password_digest
      t.string :last_name
      t.string :first_name
      t.string :last_name_furigana
      t.string :first_name_furigana
      t.integer :gender
      t.string :icon
      t.string :biography

      t.timestamps
    end
  end
end
