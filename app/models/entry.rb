class Entry < ApplicationRecord
  belongs_to :student, foreign_key: :student_id
  belongs_to :recruit_company, foreign_key: :company_id
end
