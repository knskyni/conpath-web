class Student < ApplicationRecord
  has_secure_password

  belongs_to :school_class, foreign_key: :class_id

  validates :email, {presence: true}
  validates :last_name, {presence: true}
  validates :first_name, {presence: true}
  validates :last_name_furigana, {presence: true, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :first_name_furigana, {presence: true, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :class_id, {presence: true}
  validates :gender, {presence: true}

  def student_class
    return SchoolClass.find_by(id: self.class_id)
  end

  def favorites
    return RecruitStudentCompanyFavorite.where(student_id: self.id)
  end
end
