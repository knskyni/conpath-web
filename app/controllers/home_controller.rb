class HomeController < ApplicationController
  def index
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
  end
end
