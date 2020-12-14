class Entry < ApplicationRecord
  belongs_to :student, foreign_key: :student_id
  belongs_to :recruit_post, foreign_key: :post_id

  validates :student_id, {presence: true, uniqueness: {scope: :company_id}}
  validates :company_id, {presence: true}
  validates :status, {presence: true}
  validates :start_date, {presence: true}

  def student
    return Student.find_by(id: self.student_id)
  end

  def post
    return RecruitPost.find_by(id: self.post_id)
  end
end
