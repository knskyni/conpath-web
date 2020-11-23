class AddAuthKeyToStudentCreate < ActiveRecord::Migration[5.2]
  def change
    add_column :student_creates, :auth_key, :string, after: :invite_code
  end
end
