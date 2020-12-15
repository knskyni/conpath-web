class Action < ApplicationRecord
  belongs_to :entry, foreign_key: :entry_id

  validates :entry_id, {presence: true}
  validates :title, {presence: true}
  validates :date, {presence: true}

  def entry
    return Entry.find_by(id: self.entry_id)
  end
end
