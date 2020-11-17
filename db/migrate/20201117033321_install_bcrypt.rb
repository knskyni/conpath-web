class InstallBcrypt < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :password_digest, :string, after: :password
    add_column :teachers, :password_digest, :string, after: :password
    remove_column :students, :password, :string
    remove_column :teachers, :password, :string
  end
end
