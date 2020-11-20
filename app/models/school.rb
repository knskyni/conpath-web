class School < ApplicationRecord
  validates :name, {presence: true, length: {maximum: 255}}

  def courses
    return Course.where(school_id: self.id)
  end
end
