class CourseController < ApplicationController
  def new
    # 学校取得
    school = School.find_by(id: params[:school_id])
    if school.nil?
      render_404
      return
    end

    @course = Course.new(school_id: school.id)

    set_sub_header_title("学科登録")
    add_sub_header_path(school.name, "/school/#{school.id}")
    add_sub_header_path("学科登録", nil)
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
      set_sub_header_title("学科登録")
      add_sub_header_path(school.name, "/school/#{school.id}")
      add_sub_header_path("学科登録", nil)

      render("course/new")
    end
  end

  def show
    @course = Course.find_by(id: params[:id])
    if @course.nil?
      render_404
      return
    end

    set_sub_header_title(@course.name)
    add_sub_header_path(@course.school.name, "/school/#{@course.school.id}")
    add_sub_header_path(@course.name, nil)
  end

  def edit
    @course = Course.find_by(id: params[:id])
    if @course.nil?
      render_404
      return
    end

    set_sub_header_title("学科情報編集")
    add_sub_header_path(@course.school.name, "/school/#{@course.school.id}")
    add_sub_header_path(@course.name, "/course/#{@course.id}")
    add_sub_header_path("編集", nil)
  end

  def update
    @course = Course.find_by(id: params[:id])

    if @course.nil?
      render_404
      return
    end
    
    @course.name = params[:course][:name]
    @course.number_of_enrolled_year = params[:course][:number_of_enrolled_year]

    if @course.save
      flash[:notice] = "学科情報の更新に成功しました。"
      redirect_to("/course/#{@course.id}")
    else
      set_sub_header_title("学科情報編集")
      add_sub_header_path(@course.school.name, "/school/#{@course.school.id}")
      add_sub_header_path(@course.name, "/course/#{@course.id}")
      add_sub_header_path("編集", nil)

      render("course/edit")
    end
  end
end
