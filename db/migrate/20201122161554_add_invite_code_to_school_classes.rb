class AddInviteCodeToSchoolClasses < ActiveRecord::Migration[5.2]
  def change
    add_column :school_classes, :invite_code, :string, after: :graduated
  end
end
