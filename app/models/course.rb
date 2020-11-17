class Course < ApplicationRecord
  validates :school_id, {presence: true, numericality: {only_integer: true}}
  validates :name, {presence: true, uniqueness: true}
  validates :number_of_enrolled_year, {presence: true}
end
