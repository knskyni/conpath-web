class RecruitCompanyCategoryAssign < ApplicationRecord
  validates :company_id, {presence: true}
  validates :company_category_id, {presence: true}
end
