class StudentController < ApplicationController
  def new
    @sub_header = {
        title: "学生登録",
        list: [
            {
                name: "学生登録",
                url: "/"
            }
        ]
    }
    @student = Student.new
  end

  def create
    @student = Student.new(
        id: params[:id],
        email: params[:email],
        password: params[:password],
        last_name: params[:last_name],
        first_name: params[:first_name],
        last_name_furigana: params[:last_name_furigana],
        first_name_furigana: params[:first_name_furigana],
        class_id: params[:class_id],
        gender: params[:gender],
        icon: "default_user.jpg",
    )
    if params[:password] != params[:password_confirm]
      @error_message = "パスワードが一致しません"
    end

    if @student.save and @error_message.nil?
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/student/new")
    else
      render("student/new")
    end
  end
end
