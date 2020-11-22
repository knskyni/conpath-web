class AddGraduatedToSchoolClasses < ActiveRecord::Migration[5.2]
  def change
    add_column :school_classes, :graduated, :boolean, default: false, after: :school_class
  end
end
