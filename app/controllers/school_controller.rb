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
            }
        ]
    }

    @courses = Course.where(school_id: @school.id)
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

  def edit
    @school = School.find_by(id: params[:id])

    @sub_header = {
        title: "更新フォーム",
        list: [
            {
                name: "学校",
                url: "/school"
            },
            {
                name: @school.name,
                url: "/school/#{@school.id}"
            },
            {
                name: "更新",
                url: nil
            }
        ]
    }
  end

  def update
    @school = School.find_by(id: params[:id])
    @school.name = params[:school][:name]
    if @school.save
      flash[:notice] = "学校情報の更新に成功しました。"
      redirect_to("/school/#{@school.id}")
    else
      render("school/edit")
    end
  end
end