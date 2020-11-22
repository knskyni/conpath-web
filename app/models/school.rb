class School < ApplicationRecord
  has_many :courses, foreign_key: :school_id

  validates :name, {presence: true, length: {maximum: 255}}

  def courses
    return Course.where(school_id: self.id)
  end

  def count_class
    return School.joins(courses: :school_classes).where(id: self.id).count
  end

  def count_student
    return School.joins(courses: {school_classes: :students}).where(id: self.id).count
  end
end
