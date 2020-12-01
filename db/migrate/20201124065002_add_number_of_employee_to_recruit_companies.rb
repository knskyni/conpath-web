class AddNumberOfEmployeeToRecruitCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :recruit_companies, :number_of_employee, :integer, after: :stock_list
  end
end
