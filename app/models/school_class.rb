class SchoolClass < ApplicationRecord
  belongs_to :course, foreign_key: :course_id
  has_many :students, foreign_key: :class_id

  validates :begin_year, {presence: true, format: {with: /(19|20)\d{2}/i, message: "西暦で入力してください。"}, uniqueness: { scope: [:course_id, :school_class] }}
  validates :course_id, {presence: true}
  validates :graduated, {inclusion: {in: [true, false]}}
  validates :invite_code, {presence: true}

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
