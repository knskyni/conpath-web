class RecruitPost < ApplicationRecord
  validates :recruit_code, {presence: true}
  validates :company_id, {presence: true}
  validates :year, {presence: true}
  validates :job_category_id, {presence: true}
  validates :recruitment_numbers, {presence: true}
  validates :status, {presence: true}
  validates :employment_status, {presence: true}

  def company
    return RecruitCompany.find_by(id: self.company_id)
  end

  def category
    return RecruitCompanyCategory.find_by(id: self.company_category_id)
  end
end
