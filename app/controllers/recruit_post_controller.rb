class RecruitPostController < ApplicationController
  def new
    @sub_header = {
        title: "企業情報",
        list: [
            {
                name: "情報登録",
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

end
