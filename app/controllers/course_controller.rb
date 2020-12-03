class CourseController < ApplicationController
  def new
    # 学校取得
    school = School.find_by(id: params[:school_id])
    if school.nil?
      render_404
      return
    end

    @course = Course.new(school_id: school.id)
  end

  def create
    # 学校取得
    school = School.find_by(id: params[:school_id])
    if school.nil?
      render_404
      return
    end

    @course = Course.new(
        school_id: school.id,
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

  def show
    @course = Course.find_by(id: params[:id])
  end

  def edit
    @course = Course.find_by(id: params[:id])
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.name = params[:course][:name]
    @course.number_of_enrolled_year = params[:course][:number_of_enrolled_year]

    if @course.save
      flash[:notice] = "学科情報の更新に成功しました。"
      redirect_to("/course/#{@course.id}")
    else
      render("course/edit")
    end
  end
end
