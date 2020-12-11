class RecruitCompanyCategoryAssign < ApplicationRecord
  belongs_to :recruit_company, foreign_key: :company_id

  validates :company_id, {presence: true}
  validates :company_category_id, {presence: true}

  def company
    return RecruitCompany.find_by(id: self.company_id)
  end

  def category
    return RecruitCompanyCategory.find_by(id: self.company_category_id)
  end
end
