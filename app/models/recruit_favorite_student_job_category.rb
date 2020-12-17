class RecruitFavoriteStudentJobCategory < ApplicationRecord
  def job_category
    return RecruitJobCategory.find_by(id: self.job_category_id)
  end
end
