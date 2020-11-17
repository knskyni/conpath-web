class School < ApplicationRecord
  validates :name, {presence: true}

  def courses
    return Course.where(school_id: self.id)
  end
end
