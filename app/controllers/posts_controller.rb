class PostsController < ApplicationController

  def search
    @recruit_job_category = RecruitJobCategory.all.order(created_at: :desc)
    @recruit_company_category = RecruitCompanyCategory.all.order(id: :asc)
    @recruit_post = RecruitPost.new
  end

  def search_result
    @recruit_job_category = RecruitJobCategory.all.order(created_at: :desc)
    @recruit_company_category = RecruitCompanyCategory.all.order(id: :asc)
    @keyword = params[:keyword]
    @recruit_post = RecruitPost.new(
        year: params[:year],

    )
    recruit_company = RecruitCompany.find_by(name: params[:keyword])
    category_assigns = RecruitCompanyCategoryAssign.where(company_category_id: params[:company_category_id])
    recruit_posts = RecruitPost.all

    unless params[:year] == ""
      recruit_posts = recruit_posts.where(year: params[:year])
    end

    unless params[:keyword] == ""
      recruit_posts = recruit_posts.where(company_id: recruit_company.id)
    end

    unless params[:company_category_id] == ""
      count = 1
      category_assigns.each do |category_assign|
        if count == 1
          recruit_posts = recruit_posts.where(company_id: category_assign.company_id)
        else
          recruit_posts = recruit_posts.or(company_id: category_assign.company_id)
        end
        count = count + 1
      end
    end

    unless params[:job_category_id] == ""
      recruit_posts = recruit_posts.where(job_category_id: params[:job_category_id])
    end

    unless params[:grade] == "" or params[:salary] == ""
      if params[:grade] == 2
        recruit_posts = recruit_posts.where("salary_2year >= ?", params[:salary])
      elsif params[:grade] == 3
        recruit_posts = recruit_posts.where("salary_3year >= ?", params[:salary])
      else
        recruit_posts = recruit_posts.where("salary_4year >= ?", params[:salary])
      end
    end

    unless params[:working_office]
      recruit_posts = recruit_posts.where(working_office: params[:working_office])
    end

    @recruit_posts = recruit_posts

  end
end
