class RecruitCompanyTag < ApplicationRecord
  validates :name, {presence: true}
end
