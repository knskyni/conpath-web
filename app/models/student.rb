class Student < ApplicationRecord
  has_secure_password

  belongs_to :school_class, foreign_key: :class_id
  
  validates :email, {presence: true, length: {maximum: 128}}
  validates :last_name, {presence: true, length: {maximum: 64}}
  validates :first_name, {presence: true, length: {maximum: 64}}
  validates :last_name_furigana, {presence: true, length: {maximum: 64}, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :first_name_furigana, {presence: true, length: {maximum: 64}, format: {with: /\A[ぁ-んー－]+\z/, message: "ひらがなで入力して下さい"}}
  validates :class_id, {presence: true}
  validates :gender, {presence: true}
  validates :biography, length: {maximum: 1024}
  validates :password, length: {maximum: 64}

  def student_class
    return SchoolClass.find_by(id: self.class_id)
  end

  def favorites
    return RecruitStudentCompanyFavorite.where(student_id: self.id)
  end

  def recommend_companies
    result_occurrences = ActiveRecord::Base.connection.select_all("SELECT `recruit_company_tag_assigns`.`tag_id`, COUNT(*) FROM `recruit_student_company_favorites` INNER JOIN `recruit_companies` ON `recruit_student_company_favorites`.`company_id` = `recruit_companies`.`id` INNER JOIN `recruit_company_tag_assigns` ON `recruit_companies`.`id` = `recruit_company_tag_assigns`.`company_id` WHERE `recruit_student_company_favorites`.`student_id` = '#{self.id}' GROUP BY `recruit_company_tag_assigns`.`tag_id`")
    tags = []
    result_occurrences.rows.each do |result_occurrence|
      if result_occurrence[1] > 3
        tags.push(result_occurrence[0])
      end
    end

    if tags.any?
      result_companies = ActiveRecord::Base.connection.select_all("SELECT `recruit_company_tag_assigns`.`company_id` FROM `recruit_company_tag_assigns` WHERE `recruit_company_tag_assigns`.`tag_id` IN (#{tags.map(&:inspect).join(', ')}) GROUP BY `recruit_company_tag_assigns`.`company_id`")
      companies = []
      result_companies.rows.each do |result_company|
        companies.push(result_company[0])
      end
      return RecruitCompany.where(id: companies)
    else
      return []
    end
  end

  def full_name
    return "#{self.last_name} #{self.first_name}"
  end

  def favorite_company_categories
    company_categories = RecruitFavoriteStudentIndustry.where(student_id: self.id).pluck(:industry_id)
    return company_categories
  end

  def favorite_job_categories
    job_categories = RecruitFavoriteStudentJobCategory.where(student_id: self.id).pluck(:job_category_id)
    return job_categories
  end
end
