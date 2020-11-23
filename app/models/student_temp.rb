class StudentTemp < ApplicationRecord
  validate :exist_student, :check_invite_code
  validates :student_id, {presence: true, uniqueness: true, length: {is: 7}, format: {with: /\A[0-9]+\z/, message: "半角数字で入力して下さい"}}
  validates :invite_code, {presence: true}
  validates :auth_key, {uniqueness: true, allow_nil: true}

  def exist_student
    if Student.find_by(id: self.student_id)
      errors.add(:student_id, "この学籍番号は既に本登録をしています。")
    end
  end

  def check_invite_code
    if SchoolClass.find_by(invite_code: self.invite_code).nil?
      errors.add(:invite_code, "この招待コードは存在しません。")
    else
      self.class_id = school_class.id
    end
  end
end
