class RenameCompanyIdToPostIdOnEntries < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries, :company_id, :post_id
  end
end
