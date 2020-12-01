class ChangeAuthKeyToInviteCodeOnStudentCreate < ActiveRecord::Migration[5.2]
  def change
    rename_column :student_creates, :auth_key, :invite_code
  end
end
