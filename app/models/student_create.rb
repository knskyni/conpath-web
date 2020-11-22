class StudentCreate < ApplicationRecord
  validates :auth_key, {presence: true, uniqueness: true}
  validates :student_id, {presence: true, uniqueness: true, length: {is: 7}, format: {with: /\A[0-9]+\z/, message: "半角数字で入力して下さい"}}
  validates :email, {presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "半角数字で入力して下さい"}}
end
