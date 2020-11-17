class RecruitCompanyTagAssign < ApplicationRecord
  validates :company_id, {presence: true}
  validates :tag_id, {presence: true}

  def company
    return RecruitCompany.find_by(id: self.company_id)
  end

  def tag
    return RecruitTag.find_by(id: self.tag_id)
  end
end
