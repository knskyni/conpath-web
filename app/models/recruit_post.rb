class RecruitPost < ApplicationRecord
  belongs_to :recruit_company, foreign_key: :company_id

  has_many :entries, foreign_key: :post_id

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

  def job_category
    return RecruitJobCategory.find_by(id: self.job_category_id)
  end
end
