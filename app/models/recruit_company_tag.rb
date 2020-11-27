class RecruitCompanyTag < ApplicationRecord
  validates :name, {presence: true}
  validates :tag_id,{presence: true}
end
