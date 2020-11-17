class CreateRecruitCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_companies do |t|
      t.string :company_code
      t.string :name
      t.string :name_furigana
      t.string :postal_code
      t.integer :prefecture_id
      t.string :address
      t.date :found_date
      t.string :tel_number
      t.string :fax_number
      t.string :stock_list
      t.integer :number_of_employee_male
      t.integer :number_of_employee_female
      t.integer :capital
      t.integer :proceed
      t.text :bisiness_details
      t.text :url
      t.text :recruit_url

      t.timestamps
    end
  end
end
