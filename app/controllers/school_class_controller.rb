class SchoolClassController < ApplicationController
  def new
    @course = Course.find_by(id: params[:course_id])
    render(file: "#{Rails.root}/public/404", layout: false, status: :not_found) if @course.nil?

    @school_class = SchoolClass.new(
        course_id: @course.id
    )
  end

  def create
    @course = Course.find_by(id: params[:course_id])
    render(file: "#{Rails.root}/public/404", layout: false, status: :not_found) if @course.nil?

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
      render("school_class/new")
    end
  end

  def show
    @school_class = SchoolClass.find_by(id: params[:id])
    render(file: "#{Rails.root}/public/404", layout: false, status: :not_found) if @school_class.nil?
  end

  def edit
    @school_class = SchoolClass.find_by(id: params[:id])
    render(file: "#{Rails.root}/public/404", layout: false, status: :not_found) if @school_class.nil?
  end

  def update
    @school_class = SchoolClass.find_by(id: params[:id])
    render(file: "#{Rails.root}/public/404", layout: false, status: :not_found) if @school_class.nil?

    @school_class.begin_year = params[:school_class][:begin_year]
    @school_class.school_class = params[:school_class][:school_class]
    @school_class.graduated = params[:school_class][:graduated]

    if @school_class.save
      flash[:notice] = "クラスの登録に成功しました。"
      redirect_to("/class/#{@school_class.id}")
    else
      render("school_class/edit")
    end
  end
end