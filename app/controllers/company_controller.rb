class CompanyController < ApplicationController
  before_action :check_login
  before_action :check_teacher, {only: [:new, :create, :edit, :update]}

  def new
    # view用
    @company = RecruitCompany.new(icon: "/assets/media/no-image.png")
    @company_categories = RecruitCompanyCategory.all
    @pick_company_categories = []

    # JavaScript追加
    add_custom_js("/assets/js/pages/image_input.js")

    # サブヘッダー
    set_sub_header_title("企業新規登録")
    add_sub_header_path("企業", nil)
    add_sub_header_path("登録", nil)
  end

  def create
    @company = RecruitCompany.new(
        company_code: params[:recruit_company][:company_code],
        name: params[:recruit_company][:name],
        name_furigana: params[:recruit_company][:name_furigana],
        icon: "/assets/media/no-image.png",
        postal_code: params[:recruit_company][:postal_code],
        prefecture_id: params[:recruit_company][:prefecture_id],
        address: params[:recruit_company][:address],
        found_date: params[:found_date],
        tel_number: params[:recruit_company][:tel_number],
        fax_number: params[:recruit_company][:fax_number],
        stock_list: params[:recruit_company][:stock_list],
        number_of_employee: params[:recruit_company][:number_of_employee],
        number_of_employee_male: params[:recruit_company][:number_of_employee_male],
        number_of_employee_female: params[:recruit_company][:number_of_employee_female],
        capital: params[:recruit_company][:capital],
        proceed: params[:recruit_company][:proceed],
        business_details: params[:recruit_company][:business_details],
        url: params[:recruit_company][:url],
        recruit_url: params[:recruit_company][:recruit_url],
        teacher_comment: params[:recruit_company][:teacher_comment]
    )

    @tag_name = params[:recruit_company_tags]
    if @company.save
      if params[:icon]
        image_name = "/assets/media/company/#{@company.id}.png"
        image_bin = params[:icon]
        File.binwrite("public#{image_name}", image_bin.read)

        @company.icon = "#{image_name}?v=#{Time.now.to_i}"
        @company.save
      end

      # 業種
      params[:company_category].each do |id|
        @category_assign = RecruitCompanyCategoryAssign.new(
          company_id: @company.id,
          company_category_id: id
        )
        @category_assign.save
      end

      # 企業タグ
      tag_array = params[:recruit_company_tags]
      tags = tag_array.to_s.split(nil)
      tags.each do |tag|
        # タグ検索
        @tag = RecruitCompanyTag.find_by(name: tag)

        # タグ存在
        if @tag.nil?
          # 新規タグ保存
          @tag = RecruitCompanyTag.new(name: tag)
          @tag.save
        end

        # 企業とタグを紐付け
        @tag_assign = RecruitCompanyTagAssign.new(company_id: @company.id, tag_id: @tag.id)
        @tag_assign.save
      end

      flash[:notice] = "企業情報の登録が完了しました"
      redirect_to("/company/#{@company.id}")
    else
      # view用
      @company_categories = RecruitCompanyCategory.all
      @pick_company_categories = params[:company_category]

      # JavaScript追加
      add_custom_js("/assets/js/pages/image_input.js")

      # サブヘッダー
      set_sub_header_title("企業新規登録")
      add_sub_header_path("企業", nil)
      add_sub_header_path("登録", nil)

      render("company/new")
    end
  end

  def show
    @company = RecruitCompany.find_by(id: params[:id])
    @favorite = RecruitStudentCompanyFavorite.find_by(company_id: params[:id], student_id: @current_user.id)
    @category_assigns = RecruitCompanyCategoryAssign.where(company_id: @company.id)

    # サブヘッダー
    set_sub_header_title(@company.name)
    add_sub_header_path("企業", nil)
    add_sub_header_path(@company.name, "/company/#{@company.id}")

    add_custom_js("/assets/js/pages/favorite/favorite_edit.js")
  end

  def edit
    @company_categories = RecruitCompanyCategory.all
    @company = RecruitCompany.find_by(id: params[:id])
    @assign = RecruitCompanyTagAssign.where(company_id: @company.id)
    @pick_company_categories = RecruitCompanyCategoryAssign.where(company_id: @company.id).pluck(:company_category_id)

    # サブヘッダー
    set_sub_header_title("企業情報編集")
    add_sub_header_path(@company.name, "/company/#{@company.id}")
    add_sub_header_path("編集", nil)

    # JavaScript追加
    add_custom_js("/assets/js/pages/image_input.js")
  end

  def update
    @company = RecruitCompany.find_by(id: params[:id])
    @company.company_code = params[:recruit_company][:company_code]
    @company.name = params[:recruit_company][:name]
    @company.name_furigana = params[:recruit_company][:name_furigana]
    @company.postal_code = params[:recruit_company][:postal_code]
    @company.prefecture_id = params[:recruit_company][:prefecture_id]
    @company.address = params[:recruit_company][:address]
    @company.found_date = params[:found_date]
    @company.tel_number = params[:recruit_company][:tel_number]
    @company.fax_number = params[:recruit_company][:fax_number]
    @company.stock_list = params[:recruit_company][:stock_list]
    @company.number_of_employee = params[:recruit_company][:number_of_employee]
    @company.number_of_employee_male = params[:recruit_company][:number_of_employee_male]
    @company.number_of_employee_female = params[:recruit_company][:number_of_employee_female]
    @company.capital = params[:recruit_company][:capital]
    @company.proceed = params[:recruit_company][:proceed]
    @company.business_details = params[:recruit_company][:business_details]
    @company.url = params[:recruit_company][:url]
    @company.recruit_url = params[:recruit_company][:recruit_url]

    if params[:icon]
      image_name = "/assets/media/company/#{@company.id}.png"
      image_bin = params[:icon]
      @company.icon = "#{image_name}?v=#{Time.now.to_i}"
      File.binwrite("public#{image_name}", image_bin.read)
    end

    if @company.save
      # 企業とタグの紐付けを全削除
      RecruitCompanyTagAssign.where(company_id: @company.id).destroy_all

      tag_array = params[:recruit_company_tags]
      tags = tag_array.to_s.split(nil)
      tags.each do |tag|
        # タグ検索
        @tag = RecruitCompanyTag.find_by(name: tag)

        # タグ存在
        if @tag.nil?
          # タグを保存
          @tag = RecruitCompanyTag.new(name: tag)
          @tag.save

          # 企業とタグの紐付け
          @assign = RecruitCompanyTagAssign.new(company_id: @company.id, tag_id: @tag.id)
          @assign.save
        else
          # 企業とタグの紐付けを検索
          @assign = RecruitCompanyTagAssign.find_by(company_id: @company.id, tag_id: @tag.id)

          # 企業とタグの存在がないなら
          if @assign.nil?
            # 企業とタグを紐付ける
            @assign = RecruitCompanyTagAssign.new(company_id: @company.id, tag_id: @tag.id)
            @assign.save
          end
        end
      end

      # 業種
      # 紐付けをすべて解除
      RecruitCompanyCategoryAssign.where(company_id: @company.id).destroy_all

      # 選択した業種を一つずつ登録
      params[:company_category].each do |company_category_id|
        @category_assign = RecruitCompanyCategoryAssign.new(company_id: @company.id, company_category_id: company_category_id)
        @category_assign.save
      end

      flash[:notice] = "企業情報の修正が完了しました"
      redirect_to("/company/#{@company.id}")
    else
      # view用
      @assign = RecruitCompanyTagAssign.where(company_id: @company.id)
      @pick_company_categories = RecruitCompanyCategoryAssign.where(company_id: @company.id).pluck(:company_category_id)

      # JavaScript追加
      add_custom_js("/assets/js/pages/image_input.js")

      # サブヘッダー
      set_sub_header_title("企業情報編集")
      add_sub_header_path(@company.name, "/company/#{@company.id}")
      add_sub_header_path("編集", nil)

      render("company/edit")
    end
  end
end



