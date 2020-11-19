class StudentController < ApplicationController
  def create_form
    @student = Student.new
  end

  def create
    @student = Student.new(
        id: params[:id],
        email: params[:email],
        password: params[:password],
        lastName: params[:last_name],
        firstName: params[:first_name],
        lastNameFurigana: params[:last_name_furigana],
        firstNameFurigana: params[:first_name_furigana],
        classId: params[:class_id],
        gender: params[:gender],
        icon: "default_user.jpg",
    )
    if @student.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/student/create")
    elsif params[:password] == params[:password_confirm]
      @error_message = "パスワードとパスワード確認が違います"
      render("student/create")
    else
      @error_message = ""
      render("student/create")
    end
  end
end
