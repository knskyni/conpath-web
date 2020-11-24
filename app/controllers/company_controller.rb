class CompanyController < ApplicationController
  def create_form
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
        capital: params[:capital],
        proceed: params[:proceed],
        bisiness_details: params[:bisiness_details],
        url: params[:url],
        recruit_url: params[:recruit_url],
        created_at: params[:created_at],
        updated_at: params[:updated_at]
    )
    if @recruit_company.save
      flash[:notice] = "企業情報の登録が完了しました"
      redirect_to("/campany/#{@recruit_company.id}")
    else
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
end
