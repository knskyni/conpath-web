class Teacher < ApplicationRecord
  has_secure_password

  validates :email, {presence: true, length: {maximum: 255}}
  validates :last_name, {presence: true, length: {maximum: 255}}
  validates :first_name, {presence: true,length: {maximum: 255}}
  validates :last_name_furigana, {presence: true, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}, length: {maximum: 255}}
  validates :first_name_furigana, {presence: true, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}, length: {maximum: 255}}
  validates :gender, {presence: true}
  validates :biography, {presence: false, length: {maximum: 255}}

  def full_name
    return "#{self.last_name} #{self.first_name}"
  end
end
