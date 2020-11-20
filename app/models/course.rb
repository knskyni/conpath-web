class Course < ApplicationRecord
  has_many :school_classes

  validates :school_id, {presence: true, numericality: {only_integer: true}}
  validates :name, {presence: true, uniqueness: true}
  validates :number_of_enrolled_year, {presence: true}

  def school
    return School.find_by(id: school_id)
  end

  def school_classes
    return SchoolClass.where(course_id: self.id)
  end

  def school_classes_now
    return SchoolClass.where(course_id: self.id, graduated: false)
  end

  def count_student
    return Course.joins(school_classes: :students).where(courses: {id: self.id}).count
  end
end
