class RenameBisinessDetailsToBusinessDetailsOnRecruitCompanies < ActiveRecord::Migration[5.2]
  def change
    rename_column :recruit_companies, :bisiness_details, :business_details
  end
end
