class RecruitStudentCompanyFavorite < ApplicationRecord
  validates :user_id, {presence: true}
  validates :company_id, {presence: true}
end
