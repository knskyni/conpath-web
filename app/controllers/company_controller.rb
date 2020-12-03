class CompanyController < ApplicationController
  def new
    @company = RecruitCompany.new
    @sub_header = {
        title: "企業情報追加",
        list: [
            {
                name: "General",
                url: "/"
            },
            {
                name: "Empty Page",
                url: "/test"
            }
        ]
    }
  end

  def create
    @company = RecruitCompany.new(
        company_code: params[:recruit_company][:company_code],
        name: params[:recruit_company][:name],
        name_furigana: params[:recruit_company][:name_furigana],
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
      tag_array = params[:recruit_company_tags]
      tags = tag_array.to_s.split(nil)
      tags.each do |tag|
        @tag = RecruitCompanyTag.find_by(name: tag)
        if @tag.nil?
          @tag = RecruitCompanyTag.new(
              name: tag
          )
          @tag.save
        end
        @tag_assign = RecruitCompanyTagAssign.new(
            company_id: @company.id,
            tag_id: @tag.id
        )
        @tag_assign.save
      end
      flash[:notice] = "企業情報の登録が完了しました"
      redirect_to("/company/#{@company.id}")
    else
      @sub_header = {
          title: "企業情報追加",
          list: [
              {
                  name: "General",
                  url: "/"
              },
              {
                  name: "Empty Page",
                  url: "/test"
              }
          ]
      }
      render("company/new")
    end
  end



  def show
    @company = RecruitCompany.find_by(id:params[:id])

    @sub_header = {
        title: "企業情報",
        list: [
            {
                name: "General",
                url: "/"
            },
            {
                name: "Empty Page",
                url: "/test"
            }
        ]
    }
  end

  def edit
    @company = RecruitCompany.find_by(id: params[:id])

    @assign = RecruitCompanyTagAssign.where(company_id: @company.id)
    @sub_header = {
        title: "企業情報修正",
        list: [
            {
                name: "General",
                url: "/"
            },
            {
                name: "Empty Page",
                url: "/test"
            }
        ]
    }
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
      flash[:notice] = "企業情報の修正が完了しました"
      redirect_to("/company/#{@company.id}")
    else
      @sub_header = {
          title: "企業情報修正",
          list: [
              {
                  name: "General",
                  url: "/"
              },
              {
                  name: "Empty Page",
                  url: "/test"
              }
          ]
      }

      render("company/edit")
    end
  end
end



