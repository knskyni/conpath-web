class SchoolClass < ApplicationRecord
  belongs_to :course, foreign_key: :course_id
  has_many :students, foreign_key: :class_id

  def course
    return Course.find_by(id: self.course_id)
  end

  def students
    return Student.where(class_id: self.id)
  end

  def name
    today = Date.today
    grade = ([1, 2, 3].include?(today.month)) ? today.year - self.begin_year : today.year - self.begin_year + 1

    if self.school_class
      return "#{grade}年#{self.school_class}クラス"
    else
      return "#{grade}年"
    end
  end

  def full_name
    return self.course.name + " " + self.name
  end
end
