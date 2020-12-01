class RecruitPostController < ApplicationController
  def new
    @sub_header = {
        title: "求人情報",
        list: [
            {
                name: "登録",
                url: 'recruit_post/new'
            }
        ]
    }

    @recruit_company = RecruitCompany.find_by(id: params[:company_id])
    if @recruit_company.nil?
      render(file: "#{Rails.root}/public/404", layout: false, status: :not_found)
      return
    end

    @recruit_posts = RecruitPost.new(
        company_id: @recruit_company.id
    )

  end

  def create
    @recruit_company = RecruitCompany.find_by(id: params[:company_id])
    if @recruit_company.nil?
      render(file: "#{Rails.root}/public/404", layout: false, status: :not_found)
      return
    end

    @recruit_posts = RecruitPost.new(
        recruit_code: params[:recruit_code],
        company_id: @recruit_company.id,
        year: params[:year],
        job_category_id: params[:job_category_id],
        job_description: params[:job_description],
        recruitment_numbers: params[:recruitment_numbers],
        working_office: params[:working_office],
        status: params[:status],
        employment_status: params[:employment_status],
        employment_status_other: params[:employment_status_other],
        salary_2year: params[:salary_2year],
        salary_3year: params[:salary_3year],
        salary_4year: params[:salary_4year],
        apply_method: params[:apply_method],
        submit_document: params[:submit_document],
        other_description: params[:other_description]
        )

    if @recruit_posts.save
      flash[:notice] = "求人情報の登録が完了いたしました"
      redirect_to("/")
    else
      render("/recruit_post/new")
    end
  end

  def edit
    @sub_header = {
        title: "求人情報",

        list: [
            {
                name: "変更",
                url: "/teacher/edit"
            }
        ]
    }

    @recruit_posts = RecruitPost.find_by(id: params[:id])
  end

  def update

    @recruit_posts = RecruitPost.find_by(id: params[:id])

    @recruit_posts.recruit_code = params[:recruit_code]
    @recruit_posts.year = params[:year]
    @recruit_posts.job_category_id = params[:job_category_id]
    @recruit_posts.job_description = params[:job_description]
    @recruit_posts.recruitment_numbers = params[:recruitment_numbers]
    @recruit_posts.working_office = params[:working_office]
    @recruit_posts.status = params[:status]
    @recruit_posts.employment_status = params[:employment_status]
    @recruit_posts.employment_status_other = params[:employment_status_other]
    @recruit_posts.salary_2year = params[:salary_2year]
    @recruit_posts.salary_3year = params[:salary_3year]
    @recruit_posts.salary_4year = params[:salary_4year]
    @recruit_posts.apply_method = params[:apply_method]
    @recruit_posts.submit_document = params[:submit_document]
    @recruit_posts.other_description = params[:other_description]

    if @recruit_posts.save
      flash[:notice] = "教員情報の変更を完了いたしました"
      redirect_to("/")
    else
      render("recruit_post/edit")
    end
  end

end
