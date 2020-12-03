class SchoolClassController < ApplicationController
  def new
    @course = Course.find_by(id: params[:course_id])
    if @course.nil?
      render_404
      return
    end

    @school_class = SchoolClass.new(course_id: @course.id)

    # サブヘッダー
    set_sub_header_title("クラス登録")
    add_sub_header_path(@school_class.course.school.name, "/school/#{@course.school.id}")
    add_sub_header_path(@school_class.course.name, "/course/#{@course.id}")
    add_sub_header_path("クラス登録", nil)
  end

  def create
    @course = Course.find_by(id: params[:course_id])
    if @course.nil?
      render_404
      return
    end

    @school_class = SchoolClass.new(
        begin_year: params[:school_class][:begin_year],
        course_id: @course.id,
        school_class: params[:school_class][:school_class],
        graduated: params[:school_class][:graduated],
        invite_code: SecureRandom.hex(8)
    )

    if @school_class.save
      flash[:notice] = "クラスの登録に成功しました。"
      redirect_to("/class/#{@school_class.id}")
    else
      # サブヘッダー
      set_sub_header_title("クラス登録")
      add_sub_header_path(@school_class.course.school.name, "/school/#{@school_class.course.school.id}")
      add_sub_header_path(@school_class.course.name, "/course/#{@school_class.course.id}")
      add_sub_header_path("クラス登録", nil)

      render("school_class/new")
    end
  end

  def show
    @school_class = SchoolClass.find_by(id: params[:id])
    if @school_class.nil?
      render_404
      return
    end

    # サブヘッダー
    set_sub_header_title(@school_class.name)
    add_sub_header_path(@school_class.course.school.name, "/school/#{@school_class.course.school.id}")
    add_sub_header_path(@school_class.course.name, "/course/#{@school_class.course.id}")
    add_sub_header_path("詳細", nil)
  end

  def edit
    @school_class = SchoolClass.find_by(id: params[:id])
    if @school_class.nil?
      render_404
      return
    end

    # サブヘッダー
    set_sub_header_title("クラス情報編集")
    add_sub_header_path(@school_class.course.school.name, "/school/#{@school_class.course.school.id}")
    add_sub_header_path(@school_class.course.name, "/course/#{@school_class.course.id}")
    add_sub_header_path(@school_class.name, "/class/#{@school_class.id}")
    add_sub_header_path("編集", nil)
  end

  def update
    @school_class = SchoolClass.find_by(id: params[:id])
    if @school_class.nil?
      render_404
      return
    end

    @school_class.begin_year = params[:school_class][:begin_year]
    @school_class.school_class = params[:school_class][:school_class]
    @school_class.graduated = params[:school_class][:graduated]

    if @school_class.save
      flash[:notice] = "クラスの登録に成功しました。"
      redirect_to("/class/#{@school_class.id}")
    else
      set_sub_header_title("クラス情報編集")
      add_sub_header_path(@school_class.course.school.name, "/school/#{@school_class.course.school.id}")
      add_sub_header_path(@school_class.course.name, "/course/#{@school_class.course.id}")
      add_sub_header_path(@school_class.name, "/class/#{@school_class.id}")
      add_sub_header_path("編集", nil)

      render("school_class/edit")
    end
  end
end
