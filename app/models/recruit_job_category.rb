class RecruitJobCategory < ApplicationRecord
  validates :name, {presence: true}
end
