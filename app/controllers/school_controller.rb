class SchoolController < ApplicationController
  def index
    @sub_header = {
        title: "学校一覧",
        list: [
            {
                name: "学校",
                url: "/school"
            }
        ]
    }

    # 学校一覧取得
    @schools = School.all
  end
end
