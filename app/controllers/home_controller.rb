class HomeController < ApplicationController
  def index
    if @current_user
      # サブヘッダー
      set_sub_header_title("トップページ")

      if session[:user_type] == "student"
        student = Student.find_by(id: @current_user.id)
        @recommend_companies = student.recommend_companies
        company_categories = RecruitCompanyCategoryAssign.where(company_category_id: student.favorite_company_categories.pluck(:industry_id)).group(:company_id).pluck(:company_id)
        @recommend_company_category_companies = RecruitCompany.where(id: company_categories)
        @recommend_job_category_posts = RecruitPost.where(job_category_id: student.favorite_job_categories.pluck(:job_category_id))

        render("home/index_student")
      elsif session[:user_type] == "teacher"
        @students = Student.all
        @companies = RecruitCompany.all
        @posts = RecruitPost.all
        @entries = Entry.all

        render("home/index_teacher")
      end

    else
      render("home/index", layout: false)
    end
  end
end
