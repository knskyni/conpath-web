class AddIconToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :recruit_companies, :icon, :string, after: :name_furigana
  end
end
