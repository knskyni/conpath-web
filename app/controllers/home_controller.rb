class HomeController < ApplicationController
  def index
    if @current_user
      # サブヘッダー
      set_sub_header_title("トップページ")

      if session[:user_type] == "student"
        student = Student.find_by(id: @current_user.id)
        @recommend_companies = student.recommend_companies

        render("home/index_student")
      elsif session[:user_type] == "teacher"
        render("home/index_teacher")
      end

    else
      render("home/index", layout: false)
    end
  end
end
