class PostController < ApplicationController
  def new
    # URLの企業IDから企業情報を取得
    @recruit_company = RecruitCompany.find_by(id: params[:company_id])

    # 企業情報取得できなければ404
    render_404 and return if @recruit_company.nil?

    # view用
    @job_categories = RecruitJobCategory.all
    @recruit_post = RecruitPost.new(
        company_id: @recruit_company.id
    )

    # サブヘッダー
    set_sub_header_title("求人票新規登録")
    add_sub_header_path("求人票", "/post")
    add_sub_header_path("登録", nil)
  end

  def create
    # URLの企業IDから企業情報を取得
    @recruit_company = RecruitCompany.find_by(id: params[:company_id])

    # 企業情報取得できなければ404
    render_404 and return if @recruit_company.nil?

    # view用
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
      flash[:notice] = "求人票の登録が完了しました。"
      redirect_to("/post/#{@recruit_post.id}")
    else
      # サブヘッダー
      set_sub_header_title("求人票新規登録")
      add_sub_header_path("求人票", "/post")
      add_sub_header_path("登録", nil)

      render("post/new")
    end
  end

  def show
    # URLの求人票IDから求人票情報を取得
    @recruit_post = RecruitPost.find_by(id: params[:id])

    # 求人票情報取得できなければ404
    render_404 and return if @recruit_post.nil?

    # サブヘッダー
    set_sub_header_title("#{@recruit_post.company.name}(#{@recruit_post.year}年)")
    add_sub_header_path("求人票", "/post")
    add_sub_header_path("#{@recruit_post.company.name}(#{@recruit_post.year}年)", nil)
  end

  def edit
    # URLの求人票IDから求人票情報を取得
    @recruit_post = RecruitPost.find_by(id: params[:id])

    # 求人票情報取得できなければ404
    render_404 and return if @recruit_post.nil?

    # サブヘッダー
    set_sub_header_title("編集: #{@recruit_post.company.name}(#{@recruit_post.year}年)")
    add_sub_header_path("求人票", "/post")
    add_sub_header_path("#{@recruit_post.company.name}(#{@recruit_post.year}年)", "/post/#{@recruit_post.id}")
    add_sub_header_path("編集", nil)
  end

  def update
    # URLの求人票IDから求人票情報を取得
    @recruit_post = RecruitPost.find_by(id: params[:id])

    # 求人票情報取得できなければ404
    render_404 and return if @recruit_post.nil?

    # フォームデータを挿入
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
      # サブヘッダー
      set_sub_header_title("編集: #{@recruit_post.company.name}(#{@recruit_post.year}年)")
      add_sub_header_path("求人票", "/post")
      add_sub_header_path("#{@recruit_post.company.name}(#{@recruit_post.year}年)", "/post/#{@recruit_post.id}")
      add_sub_header_path("編集", nil)
      
      render("post/edit")
    end
  end
end
