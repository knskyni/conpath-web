class ChangeNameClassColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :school_classes, :class, :school_class
  end
end
