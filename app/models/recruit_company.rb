class RecruitCompany < ApplicationRecord
  has_many :recruit_posts, foreign_key: :company_id
  has_many :recruit_company_category_assigns, foreign_key: :company_id
  has_many :recruit_company_tag_assigns, foreign_key: :company_id

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

  def posts
    return RecruitPost.where(company_id: self.id)
  end

  def similar_companies
    categories = RecruitCompanyCategoryAssign.where(company_id: self.id).pluck(:company_category_id)
    picks = RecruitCompanyTagAssign.joins(:recruit_company).joins("LEFT OUTER JOIN `recruit_company_category_assigns` ON `recruit_companies`.`id` = `recruit_company_category_assigns`.`company_id`").where.not(recruit_companies: {id: self.id}).where(recruit_company_category_assigns: {company_category_id: categories}).where(recruit_company_tag_assigns: {tag_id: self.tag_assigns.pluck(:tag_id)}).group(:company_id).order("COUNT(`recruit_company_tag_assigns`.`company_id`) DESC").select(:company_id).limit(6).pluck(:company_id)
    return RecruitCompany.where(id: picks)
  end
end
