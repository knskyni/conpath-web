class RecruitStudentCompanyFavorite < ApplicationRecord
  validates :student_id, {presence: true}
  validates :company_id, {presence: true}

  def company
    return RecruitCompany.find_by(id: self.company_id)
  end
end
