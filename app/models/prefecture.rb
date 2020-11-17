class Prefecture < ApplicationRecord
  validates :name, {presence: true}
  validates :name_furigana, {presence: true, format: {with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなのみで入力して下さい"}}
end
