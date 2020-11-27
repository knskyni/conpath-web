class CompanyController < ApplicationController
  def new
    @recruit_company = RecruitCompany.new
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
    @recruit_company = RecruitCompany.new(
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
        number_of_employee_male: params[:recruit_company][:number_of_employee_male],
        number_of_employee_female: params[:recruit_company][:number_of_employee_female],
        number_of_employee: params[:recruit_company][:number_of_employee],
        capital: params[:recruit_company][:capital],
        proceed: params[:recruit_company][:proceed],
        business_details: params[:recruit_company][:business_details],
        url: params[:recruit_company][:url],
        recruit_url: params[:recruit_company][:recruit_url],
        teacher_comment: params[:recruit_company][:teacher_comment]
    )
    if @recruit_company.save
      flash[:notice] = "企業情報の登録が完了しました"
      redirect_to("/company/#{@recruit_company.id}")
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
    @recruit_company = RecruitCompany.find_by(id:params[:id])

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
    @recruit_company = RecruitCompany.find_by(id: params[:id])
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
    @recruit_company = RecruitCompany.find_by(id: params[:id])
    @recruit_company.company_code = params[:recruit_company][:company_code]
    @recruit_company.name = params[:recruit_company][:name]
    @recruit_company.name_furigana = params[:recruit_company][:name_furigana]
    @recruit_company.postal_code = params[:recruit_company][:postal_code]
    @recruit_company.prefecture_id = params[:recruit_company][:prefecture_id]
    @recruit_company.address = params[:recruit_company][:address]
    @recruit_company.found_date = params[:found_date]
    @recruit_company.tel_number = params[:recruit_company][:tel_number]
    @recruit_company.fax_number = params[:recruit_company][:fax_number]
    @recruit_company.stock_list = params[:recruit_company][:stock_list]
    @recruit_company.number_of_employee_male = params[:recruit_company][:number_of_employee_male]
    @recruit_company.number_of_employee_female = params[:recruit_company][:number_of_employee_female]
    @recruit_company.number_of_employee = params[:recruit_company][:number_of_employee]
    @recruit_company.capital = params[:recruit_company][:capital]
    @recruit_company.proceed = params[:recruit_company][:proceed]
    @recruit_company.business_details = params[:recruit_company][:business_details]
    @recruit_company.url = params[:recruit_company][:url]
    @recruit_company.recruit_url = params[:recruit_company][:recruit_url]

    if @recruit_company.save
      flash[:notice] = "企業情報の修正が完了しました"
      redirect_to("/company/#{@recruit_company.id}")
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
