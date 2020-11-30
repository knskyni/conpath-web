class RecruitCompany < ApplicationRecord
  validates :company_code, {presence: true, numericality: {only_integer: true}}
  validates :name, {presence: true}
  validates :name_furigana, {presence: true}
  validates :postal_code, {presence: true, length: { is: 8 }, format: {with: /\A\d{3}[-]\d{4}\z/, message: "ハイフン付きの郵便番号を入力して下さい"}}
  validates :prefecture_id, {presence: true}
  validates :address, {presence: true}
  validates :found_date, {presence: true}
  validates :tel_number, {presence: true, format: {with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z/, message: "ハイフンなしの電話番号を入力して下さい"}}
  validates :fax_number, {format: {with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}|\A\z/, message: "ハイフンなしの電話番号を入力して下さい"}}

  def prefecture
    return Prefecture.find_by(id: self.prefecture_id)
  end

  def tag_assigns
    return RecruitCompanyTagAssign.where(company_id: self.id)
  end
end
