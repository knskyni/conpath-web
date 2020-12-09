class PostController < ApplicationController
  def new
    # URLの企業IDから企業情報を取得
    @company = RecruitCompany.find_by(id: params[:company_id])

    # 企業情報取得できなければ404
    render_404 and return if @company.nil?

    # view用
    @job_categories = RecruitJobCategory.all
    @post = RecruitPost.new(
        company_id: @company.id
    )

    # サブヘッダー
    set_sub_header_title("求人票新規登録")
    add_sub_header_path("求人票", "/post")
    add_sub_header_path("登録", nil)
  end

  def create
    # URLの企業IDから企業情報を取得
    @company = RecruitCompany.find_by(id: params[:company_id])

    # 企業情報取得できなければ404
    render_404 and return if @company.nil?

    # view用
    @post = RecruitPost.new(
        recruit_code: params[:recruit_code],
        company_id: @company.id,
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

    if @post.save
      flash[:notice] = "求人票の登録が完了しました。"
      redirect_to("/post/#{@post.id}")
    else
      # view用
      @job_categories = RecruitJobCategory.all

      # サブヘッダー
      set_sub_header_title("求人票新規登録")
      add_sub_header_path("求人票", "/post")
      add_sub_header_path("登録", nil)

      render("post/new")
    end
  end

  def show
    # URLの求人票IDから求人票情報を取得
    @post = RecruitPost.find_by(id: params[:id])

    # 求人票情報取得できなければ404
    render_404 and return if @post.nil?

    # サブヘッダー
    set_sub_header_title("#{@post.company.name}（#{@post.year}年）")
    add_sub_header_path("求人票", "/post")
    add_sub_header_path("#{@post.company.name}（#{@post.year}年）", nil)
  end

  def edit
    # URLの求人票IDから求人票情報を取得
    @post = RecruitPost.find_by(id: params[:id])

    # 求人票情報取得できなければ404
    render_404 and return if @post.nil?

    # view用
    @job_categories = RecruitJobCategory.all

    # サブヘッダー
    set_sub_header_title("編集: #{@post.company.name}（#{@post.year}年）")
    add_sub_header_path("求人票", "/post")
    add_sub_header_path("#{@post.company.name}（#{@post.year}年）", "/post/#{@post.id}")
    add_sub_header_path("編集", nil)
  end

  def update
    # URLの求人票IDから求人票情報を取得
    @post = RecruitPost.find_by(id: params[:id])

    # 求人票情報取得できなければ404
    render_404 and return if @post.nil?

    # フォームデータを挿入
    @post.recruit_code = params[:recruit_code]
    @post.year = params[:year]
    @post.job_category_id = params[:job_category_id]
    @post.job_description = params[:job_description]
    @post.recruitment_numbers = params[:recruitment_numbers]
    @post.working_office = params[:working_office]
    @post.status = params[:status]
    @post.employment_status = params[:employment_status]
    @post.employment_status_other = params[:employment_status_other]
    @post.salary_2year = params[:salary_2year]
    @post.salary_3year = params[:salary_3year]
    @post.salary_4year = params[:salary_4year]
    @post.apply_method = params[:apply_method]
    @post.submit_document = params[:submit_document]
    @post.other_description = params[:other_description]

    if @post.save
      flash[:notice] = "教員情報の変更を完了いたしました"
      redirect_to("/")
    else
      # view用
      @job_categories = RecruitJobCategory.all

      # サブヘッダー
      set_sub_header_title("編集: #{@post.company.name}（#{@post.year}年）")
      add_sub_header_path("求人票", "/post")
      add_sub_header_path("#{@post.company.name}（#{@post.year}年）", "/post/#{@post.id}")
      add_sub_header_path("編集", nil)

      render("post/edit")
    end
  end
end
