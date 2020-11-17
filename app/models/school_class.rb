class SchoolClass < ApplicationRecord
  def course
    return Course.find_by(id: self.course_id)
  end
end
