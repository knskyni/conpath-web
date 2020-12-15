class Entry < ApplicationRecord
  belongs_to :student, foreign_key: :student_id
  belongs_to :recruit_post, foreign_key: :post_id

  has_many :actions, foreign_key: :entry_id

  validates :student_id, {presence: true, uniqueness: {scope: :post_id}}
  validates :post_id, {presence: true}
  validates :status, {presence: true}

  def student
    return Student.find_by(id: self.student_id)
  end

  def post
    return RecruitPost.find_by(id: self.post_id)
  end
end
