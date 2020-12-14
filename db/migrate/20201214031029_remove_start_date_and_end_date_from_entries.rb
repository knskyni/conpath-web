class RemoveStartDateAndEndDateFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :start_date
    remove_column :entries, :end_date
  end
end
