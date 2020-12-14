class ActivityController < ApplicationController
  def create
    company = RecruitCompany.find_by(id: params[:company_id])

    # 企業IDが存在しなければ404エラー
    render_404 and return if company.nil?

    entry = Entry.new(student_id: @current_user.id, company_id: company.id, start_date: Time.now.to_date)

    if entry.save
      redirect_to("/activity/#{entry.id}")
    else
      flash[:notice] = "登録することができませんでした。"
      redirect_to("/")
    end
  end
end
