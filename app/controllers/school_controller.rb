class SchoolController < ApplicationController
  before_action :check_login
  before_action :check_teacher, {only: [:new, :create, :edit, :update]}

  def index
    # 学校一覧取得
    @schools = School.all

    # サブヘッダー
    set_sub_header_title("学校一覧")
    add_sub_header_path("学校", "/school")
  end

  def show
    @school = School.find_by(id: params[:id])
    if @school.nil?
      render_404
      return
    end

    @courses = Course.where(school_id: @school.id)

    # サブヘッダー
    set_sub_header_title(@school.name)
    add_sub_header_path("学校", "/school")
    add_sub_header_path(@school.name, nil)
  end

  def new
    @school = School.new

    # サブヘッダー
    set_sub_header_title("新規登録")
    add_sub_header_path("学校", "/school")
    add_sub_header_path("新規登録", nil)
  end

  def create
    @school = School.new(name: params[:school][:name])
    if @school.save
      flash[:notice] = "学校の登録に成功しました。"
      redirect_to("/school/#{@school.id}")
    else
      # サブヘッダー
      set_sub_header_title("新規登録")
      add_sub_header_path("学校", "/school")
      add_sub_header_path("新規登録", nil)

      render("school/new")
    end
  end

  def edit
    @school = School.find_by(id: params[:id])

    if @school.nil?
      render_404
      return
    end

    # サブヘッダー
    set_sub_header_title("学校情報更新")
    add_sub_header_path("学校", "/school")
    add_sub_header_path(@school.name, "/school/#{@school.id}")
    add_sub_header_path("更新", nil)
  end

  def update
    @school = School.find_by(id: params[:id])

    if @school.nil?
      render_404
      return
    end

    @school.name = params[:school][:name]
    if @school.save
      flash[:notice] = "学校情報の更新に成功しました。"
      redirect_to("/school/#{@school.id}")
    else
      # サブヘッダー
      set_sub_header_title("学校情報更新")
      add_sub_header_path("学校", "/school")
      add_sub_header_path(@school.name, "/school/#{@school.id}")
      add_sub_header_path("更新", nil)
      render("school/edit")
    end
  end
end
