class RecruitFavoriteStudentIndustry < ApplicationRecord
  def industry
    return RecruitCompanyCategory.find_by(id: self.industry_id)
  end
end
