class TeacherController < ApplicationController
  def new
<<<<<<< HEAD
    @sub_header = {
        title: "教員プロフィール",
=======
    @teacher = Teacher.new
    @sub_header = {
        title: "教員登録",
>>>>>>> teacher_create
        list: [
            {
                name: "教員登録",
                url: "/teacher/new"
            }
        ]
    }
<<<<<<< HEAD
    @teacher = Teacher.new
=======
>>>>>>> teacher_create
  end

  def create
    @teacher = Teacher.new(
<<<<<<< HEAD
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
      flash[:notice] = "教員登録を完了いたしました"
      redirect_to("/")
=======
        lastName: params[:last_name],
        firstName: params[:first_name],
        lastNameFurigana: params[:last_name_furigana],
        firstNameFurigana: params[:first_name_furigana],
        email: params[:email],
        password: params[:password],
        gender: params[:gender],
        biography: params[:biography]
    )
    if @teacher.save
      flash[:notice] = "教員登録を完了いたしました"
      redirect_to("/teacher/new")
>>>>>>> teacher_create
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

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end
end
