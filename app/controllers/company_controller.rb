class CompanyController < ApplicationController
  def create_form
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
        company_code: params[:company_code],
        name: params[:name],
        name_furigana: params[:name_furigana],
        postal_code: params[:postal_code],
        prefecture_id: params[:prefecture_id],
        address: params[:address],
        found_date: params[:found_date],
        tel_number: params[:tel_number],
        fax_number: params[:fax_number],
        stock_list: params[:stock_list],
        number_of_employee_male: params[:number_of_employee_male],
        number_of_employee_female: params[:number_of_employee_female],
        number_of_employee: params[:number_of_employee],
        capital: params[:capital],
        proceed: params[:proceed],
        bisiness_details: params[:bisiness_details],
        url: params[:url],
        recruit_url: params[:recruit_url]
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
      
      render("company/create_form")
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
    @recruit_company.company_code = params[:company_code]
    @recruit_company.name = params[:name]
    @recruit_company.name_furigana = params[:name_furigana]
    @recruit_company.postal_code = params[:postal_code]
    @recruit_company.prefecture_id = params[:prefecture_id]
    @recruit_company.address = params[:address]
    @recruit_company.found_date = params[:found_date]
    @recruit_company.tel_number = params[:tel_number]
    @recruit_company.fax_number = params[:fax_number]
    @recruit_company.stock_list = params[:stock_list]
    @recruit_company.number_of_employee_male = params[:number_of_employee_male]
    @recruit_company.number_of_employee_female = params[:number_of_employee_female]
    @recruit_company.number_of_employee = params[:number_of_employee]
    @recruit_company.capital = params[:capital]
    @recruit_company.proceed = params[:proceed]
    @recruit_company.bisiness_details = params[:bisiness_details]
    @recruit_company.url = params[:url]
    @recruit_company.recruit_url = params[:recruit_url]
    @recruit_company.save
    redirect_to("/company/#{@recruit_company.id}")
  end
end
