class SchoolClass < ApplicationRecord
  belongs_to :course
  has_many :students, foreign_key: :class_id

  def course
    return Course.find_by(id: self.course_id)
  end

  def students
    return Student.where(class_id: self.id)
  end
end
