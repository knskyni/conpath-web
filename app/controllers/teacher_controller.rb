class TeacherController < ApplicationController
  def new
    @sub_header = {
        title: "教員プロフィール",

        list: [
            {
                name: "教員情報登録",
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
end
