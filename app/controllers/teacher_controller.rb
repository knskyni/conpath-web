class TeacherController < ApplicationController
  def new
    @sub_header = {
        title: "教員登録",
        list: [
            {
                name: "教員登録",
                url: "/teacher/new"
            }
        ]
    }
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(
        lastName: params[:last_name],
        firstName: params[:first_name],
        lastNameFurigana: params[:last_name_furigana],
        firstNameFurigana: params[:first_name_furigana],
        email: params[:email],
        password: params[:password],
        gender: params[:gender],
        icon: "assets/image",
        biography: params[:biography]
    )
    if params[:password] != params[:password_confirm]
      @error_message = "パスワードが一致しません"
    end
    if @teacher.save and @error_message.nil?
      flash[:notice] = "教員登録を完了いたしました"
      redirect_to("/teacher/new")
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

end
