class CourseController < ApplicationController
  def new
    @course = Course.new(school_id: params[:school_id])
  end

  def create
    @course = Course.new(
        school_id: params[:school_id],
        name: params[:course][:name],
        number_of_enrolled_year: params[:course][:number_of_enrolled_year]
    )

    if @course.save
      flash[:notice] = "学科の登録に成功しました。"
      redirect_to("/course/#{@course.id}")
    else
      render("course/new")
    end
  end
end
