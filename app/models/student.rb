class Student < ApplicationRecord
  has_secure_password

  belongs_to :school_class, foreign_key: :class_id
  
  validates :email, {presence: true, length: {maximum: 128}}
  validates :last_name, {presence: true, length: {maximum: 64}}
  validates :first_name, {presence: true, length: {maximum: 64}}
  validates :last_name_furigana, {presence: true, length: {maximum: 64}, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :first_name_furigana, {presence: true, length: {maximum: 64}, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :class_id, {presence: true}
  validates :gender, {presence: true}
  validates :biography, length: {maximum: 1024}
  validates :password, length: {maximum: 64 }

  def student_class
    return SchoolClass.find_by(id: self.class_id)
  end

  def favorites
    return RecruitStudentCompanyFavorite.where(student_id: self.id)
  end
end
