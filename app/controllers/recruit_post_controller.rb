class RecruitPostController < ApplicationController
  def new
    @recruit_posts = RecruitPost.new
    @sub_header = {
        titile: "求人票作成ページ"
    }
  end
end
