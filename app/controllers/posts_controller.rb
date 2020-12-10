class PostsController < ApplicationController
  before_action :check_login

  def search
    set_sub_header_title("求人票検索")
    add_sub_header_path("求人票", nil)
    add_sub_header_path("検索", "/posts/search")
    @recruit_job_category = RecruitJobCategory.all.order(created_at: :desc)
    @recruit_company_category = RecruitCompanyCategory.all.order(id: :asc)
    @recruit_post = RecruitPost.new
  end

  def search_result
    set_sub_header_title("求人票検索結果")
    add_sub_header_path("求人票", nil)
    add_sub_header_path("検索", "/posts/search")
    add_sub_header_path("結果", "/posts/search/result")
    @recruit_job_category = RecruitJobCategory.all.order(created_at: :desc)
    @recruit_company_category = RecruitCompanyCategory.all.order(id: :asc)
    @keyword = params[:keyword]
    @recruit_post = RecruitPost.new(
        year: params[:year],
    )
    category_assigns = RecruitCompanyCategoryAssign.where(company_category_id: params[:company_category_id])
    @recruit_posts = RecruitPost.joins("INNER JOIN `recruit_companies` ON `recruit_companies`.`id` = `recruit_posts`.`company_id` LEFT OUTER JOIN `recruit_company_category_assigns` ON `recruit_company_category_assigns`.`company_id` = `recruit_companies`.`id`").all

    unless @recruit_posts==nil?
      unless params[:year] == ""
        @recruit_posts = @recruit_posts.where(year: params[:year])
      end
    end

    unless @recruit_posts==nil?
      unless params[:keyword] == ""
        @recruit_posts = @recruit_posts.where("name_furigana like ?", "%#{params[:keyword]}%")
      end
    end

    unless @recruit_posts==nil?
      unless params[:company_category_id] == ""
        @recruit_posts = @recruit_posts.where("`company_category_id` = ?", "#{params[:company_category_id]}")
      end
    end

    unless @recruit_posts==nil?
      unless params[:job_category_id] == ""
        @recruit_posts = @recruit_posts.where(job_category_id: params[:job_category_id])
      end
    end

    unless @recruit_posts==nil?
      unless params[:grade] == "" or params[:salary] == ""
        if params[:grade] == "2"
          @recruit_posts = @recruit_posts.where("salary_2year >= ?", params[:salary])
        elsif params[:grade] == "3"
          @recruit_posts = @recruit_posts.where("salary_3year >= ?", params[:salary])
        elsif params[:grade] == "4"
          @recruit_posts = @recruit_posts.where("salary_4year >= ?", params[:salary])
        end
      end
    end

    unless @recruit_posts==nil?
      unless params[:working_office] == ""
        @recruit_posts = @recruit_posts.where("working_office like ?", "%#{params[:working_office]}%")
      end
    end
  end
end
