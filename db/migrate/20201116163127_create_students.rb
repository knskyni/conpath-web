class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :email
      t.string :password
      t.string :last_name
      t.string :first_name
      t.string :last_name_furigana
      t.string :first_name_furigana
      t.string :icon
      t.text :biography
      t.datetime :school_access_at

      t.timestamps
    end
  end
end
