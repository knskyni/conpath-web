class RecruitStudentCompanyFavorite < ApplicationRecord
  validates :student_id, {presence: true}
  validates :company_id, {presence: true}
end
