class TeacherController < ApplicationController
  before_action :check_login, {only: [:new, :create, :edit, :update, :password_edit, :password_update]}
  before_action :check_teacher, {only: [:logout, :new, :create, :edit, :update, :password_edit, :password_update]}

  def login
    render(layout: false)
  end

  def auth
    @teacher = Teacher.find_by(email: params[:email])

    if @teacher && @teacher.authenticate(params[:password])
      session[:user_type] = "teacher"
      session[:user_id] = @teacher.id
      flash[:notice] = "ログインしました。"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています。"
      @email = params[:email]
      render("teacher/login", layout: false)
    end
  end

  def logout
    session[:user_type] = nil
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/teacher/login")
  end

  def new
    # サブヘッダー
    set_sub_header_title("新規教員登録")
    add_sub_header_path("教員", "/teacher")

    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(
        last_name: params[:last_name],
        first_name: params[:first_name],
        last_name_furigana: params[:last_name_furigana],
        first_name_furigana: params[:first_name_furigana],
        email: params[:email],
        password: params[:password],
        gender: params[:gender],
        icon: "/assets/media/users/blank.png",
        biography: params[:biography]
    )

    if params[:password] != params[:password_confirm]
      @error_message = "パスワードが一致しません"
    end

    if @teacher.save
      flash[:notice] = "教員情報の登録を完了いたしました"
      redirect_to("/")
    else
      # サブヘッダー
      set_sub_header_title("新規教員登録")
      add_sub_header_path("教員", "/teacher")

      render("/teacher/new")
    end
  end

  def edit
    @teacher = Teacher.find_by(id: @current_user.id)

    # サブヘッダー
    set_sub_header_title("教員情報編集")
    add_sub_header_path("教員", "/teacher")
    add_sub_header_path("プロフィール", "/teacher/#{@teacher.id}")
    add_sub_header_path("編集", nil)
  end

  def update
    @teacher = Teacher.find_by(id: @current_user.id)
    @teacher.last_name = params[:last_name]
    @teacher.first_name = params[:first_name]
    @teacher.last_name_furigana = params[:last_name_furigana]
    @teacher.first_name_furigana = params[:first_name_furigana]
    @teacher.email = params[:email]
    @teacher.gender = params[:gender]
    @teacher.icon = params[:icon]
    @teacher.biography = params[:biography]
    if @teacher.save
      flash[:notice] = "教員情報の変更を完了いたしました"
      redirect_to("/")
    else
      # サブヘッダー
      set_sub_header_title("教員情報編集")
      add_sub_header_path("教員", "/teacher")
      add_sub_header_path("プロフィール", "/teacher/#{@teacher.id}")
      add_sub_header_path("編集", nil)

      render("teacher/edit")
    end
  end

  def password_edit
    @teacher = Teacher.find_by(id: @current_user.id)

    # サブヘッダー
    set_sub_header_title("教員情報編集")
    add_sub_header_path("教員", "/teacher")
    add_sub_header_path("プロフィール", "/teacher/#{@teacher.id}")
    add_sub_header_path("パスワード変更", nil)
  end

  def password_update
    @teacher = Teacher.find_by(id: @current_user.id)
    @error_messages = []
    unless @teacher.authenticate(params[:password])
      @error_messages.push("現在のパスワードが違います")
    end

    if params[:new_password] != params[:password_confirm]
      @error_messages.push("パスワードが一致しません")
    end

    @teacher.password = params[:new_password]

    if @teacher.save and not @error_messages.any?
      flash[:notice] = "パスワードを変更しました"
      redirect_to("/")
    else
      # サブヘッダー
      set_sub_header_title("教員情報編集")
      add_sub_header_path("教員", "/teacher")
      add_sub_header_path("プロフィール", "/teacher/#{@teacher.id}")
      add_sub_header_path("パスワード変更", nil)

      render("teacher/password_edit")
    end
  end
end
