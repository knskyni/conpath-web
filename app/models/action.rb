class Action < ApplicationRecord
  belongs_to :entry, foreign_key: :entry_id
end
