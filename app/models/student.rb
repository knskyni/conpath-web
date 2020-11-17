class Student < ApplicationRecord
  has_secure_password

  validates :email, {presence: true}
  validates :last_name, {presence: true}
  validates :first_name, {presence: true}
  validates :last_name_furigana, {presence: true, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :first_name_furigana, {presence: true, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :class_id, {presence: true}
  validates :gender, {presence: true}
end
