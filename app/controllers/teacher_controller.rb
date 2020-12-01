class TeacherController < ApplicationController
  def new
    @sub_header = {
        title: "入力",
        list: [
            {
                name: "教員",
                url: "/teacher"
            },{
            name: "新規登録",
            url: "/teacher/new"
        }
        ]
    }
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
        icon: "assets/image",
        biography: params[:biography]
    )

    if params[:password] != params[:password_confirm]
      @error_message = "パスワードが一致しません"
    end

    if @teacher.save
      flash[:notice] = "教員情報の登録を完了いたしました"
      redirect_to("/")
    else
      @teacher.last_name = params[:last_name]
      @teacher.first_name = params[:first_name]
      @teacher.last_name_furigana = params[:last_name_furigana]
      @teacher.first_name_furigana = params[:first_name_furigana]
      @teacher.email = params[:email]
      @teacher.biography = params[:biography]
      render("/teacher/new")
    end
  end

  def edit
    @sub_header = {
        title: "教員プロフィール",
        list: [
            {
                name: "教員情報修正",
                url: "/teacher/edit"
            }
        ]
    }
    @teacher = Teacher.find_by(id: params[:id])
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
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
      render("teacher/edit")
    end
  end

  def password_edit
    @sub_header = {
        title: "教員プロフィール",
        list: [
            {
                name: "教員情報パスワードの変更",
                url: "/teacher/password_edit"
            }
        ]
    }
    @teacher = Teacher.find_by(id: params[:id])
  end

  def password_update
    @teacher = Teacher.find_by(id: params[:id])
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
      render("teacher/password_edit")
    end
  end

end
