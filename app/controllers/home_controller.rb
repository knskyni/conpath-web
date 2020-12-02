class HomeController < ApplicationController
  def index
    if @current_user
      # サブヘッダー
      set_sub_header_title("トップページ")

      if session[:user_type] == "student"
        student = Student.find_by(id: @current_user.id)
        @recommend_companies = student.recommend_companies
      end
      render("home/index_after")
    else
      render("home/index_before", layout: false)
    end
  end
end
