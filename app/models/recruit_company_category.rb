class RecruitCompanyCategory < ApplicationRecord
  validates :name, {presence: true}
end
