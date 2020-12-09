class PostController < ApplicationController
  def new
    @recruit_company = RecruitCompany.find_by(id: params[:company_id])
    if @recruit_company.nil?
      render_404
      return
    end

    @job_categories = RecruitJobCategory.all
    @recruit_post = RecruitPost.new(
        company_id: @recruit_company.id
    )

    # サブヘッダー
    set_sub_header_title("求人情報登録")
    add_sub_header_path("求人票一覧", "/recruit_post/show/#{@recruit_post.id}")
    add_sub_header_path("登録", "/recruit_post/new/#{@recruit_company.id}")
    add_sub_header_path("編集", nil)
  end

  def create
    @recruit_company = RecruitCompany.find_by(id: params[:company_id])
    if @recruit_company.nil?
      render_404
      return
    end

    @recruit_post = RecruitPost.new(
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

    if @recruit_post.save
      flash[:notice] = "求人情報の登録が完了いたしました"
      redirect_to("/")
    else
      render("post/new")
    end
  end

  def show
    @recruit_post = RecruitPost.find_by(id: params[:id])
    if @recruit_post.nil?
      render_404
      return
    end

    # サブヘッダー
    set_sub_header_title("求人票一覧")
    add_sub_header_path("求人票", "/recruit_post/show/#{@recruit_post.id}")
    add_sub_header_path("#{@recruit_post.company.name}", nil)

  end

  def edit
    @recruit_post = RecruitPost.find_by(id: params[:id])

    @recruit_company = RecruitCompany.find_by(id: params[:company_id])
    if @recruit_company.nil?
      render_404
      return
    end

    set_sub_header_title("求人情報編集")
    add_sub_header_path("求人票一覧", "/recruit_post/show/#{@recruit_post.id}")
    add_sub_header_path("登録", "/recruit_post/new/#{@recruit_company.id}")
    add_sub_header_path("編集", nil)
  end

  def update
    @recruit_post = RecruitPost.find_by(id: params[:id])
    @recruit_post.recruit_code = params[:recruit_code]
    @recruit_post.year = params[:year]
    @recruit_post.job_category_id = params[:job_category_id]
    @recruit_post.job_description = params[:job_description]
    @recruit_post.recruitment_numbers = params[:recruitment_numbers]
    @recruit_post.working_office = params[:working_office]
    @recruit_post.status = params[:status]
    @recruit_post.employment_status = params[:employment_status]
    @recruit_post.employment_status_other = params[:employment_status_other]
    @recruit_post.salary_2year = params[:salary_2year]
    @recruit_post.salary_3year = params[:salary_3year]
    @recruit_post.salary_4year = params[:salary_4year]
    @recruit_post.apply_method = params[:apply_method]
    @recruit_post.submit_document = params[:submit_document]
    @recruit_post.other_description = params[:other_description]

    if @recruit_post.save
      flash[:notice] = "教員情報の変更を完了いたしました"
      redirect_to("/")
    else
      render("post/edit")
    end
  end
end
