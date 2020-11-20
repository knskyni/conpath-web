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

  def show
    @school = School.find_by(id: params[:id])
    if @school.nil?
      render :file => "#{Rails.root}/public/404", layout: false, status: :not_found
      return
    end
    @sub_header = {
        title: @school.name,
        list: [
            {
                name: "学校",
                url: "/school"
            },
            {
                name: "詳細",
                url: "/school/#{@school.id}"
            }
        ]
    }

    @count_class = 0
    @count_student = 0
    @school.courses.each do |course|
      school_classes = course.school_classes_now
      @count_class += school_classes.count
      school_classes.each do |school_class|
        @count_student += school_class.students.count
      end
    end
  end

  def new
    @sub_header = {
        title: "登録フォーム",
        list: [
            {
                name: "学校",
                url: "/school"
            }
        ]
    }

    @school = School.new
  end

  def create
    @school = School.new(name: params[:school][:name])
    if @school.save
      flash[:notice] = "学校の登録に成功しました。"
      redirect_to("/school/#{@school.id}")
    else
      render("school/new")
    end
  end
end
