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
      render("home/index_after")
    else
      render("home/index_before", layout: false)
    end
  end
end
