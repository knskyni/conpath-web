class RecruitCompanyCategory < ApplicationRecord
  has_many :recruit_company_category_assigns, foreign_key: :company_category_id

  validates :name, {presence: true}
end
