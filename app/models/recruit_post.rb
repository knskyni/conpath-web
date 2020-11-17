class RecruitPost < ApplicationRecord
  validates :recruit_code, {presence: true}
  validates :company_id, {presence: true}
  validates :year, {presence: true}
  validates :job_category_id, {presence: true}
  validates :recruitment_numbers, {presence: true}
  validates :status, {presence: true}
  validates :employment_status, {presence: true}
end
