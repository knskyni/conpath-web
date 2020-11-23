class StudentCreate < ApplicationRecord
  validate :check_create

  validates :student_id, {presence: true, uniqueness: true, length: {is: 7}, format: {with: /\A[0-9]+\z/, message: "半角数字で入力して下さい"}}
  validates :invite_code, {presence: true}
  validates :auth_key, {uniqueness: true, allow_nil: true}

  def check_create
    school_class = SchoolClass.find_by(invite_code: self.invite_code)
    if school_class.nil?
      errors.add(:invite_code, "招待コードが有効ではありません。")
    end

    student = Student.find_by(id: self.student_id)
    if student
      errors.add(:student_id, "この学籍番号は既に登録済みです。")
    end
  end
end
