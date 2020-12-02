class HomeController < ApplicationController
  def index
    if @current_user
      @sub_header = {
          title: "General",
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
