class Course < ApplicationRecord
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
end
