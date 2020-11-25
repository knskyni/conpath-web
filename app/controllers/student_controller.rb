class StudentController < ApplicationController
  def login
    render(layout: false)
  end

  def new
    @sub_header = {
        title: "登録ページ",
        list: [
            {
                name: "学生",
                url: "/student"
            }
        ]
    }

    @student_temp = StudentTemp.new
  end

  def create_temp
    @student_temp = StudentTemp.find_by(student_id: params[:student_temp][:student_id])

    if @student_temp
      @student_temp.invite_code = params[:student_temp][:invite_code]
    else
      @student_temp = StudentTemp.new(
          student_id: params[:student_temp][:student_id],
          invite_code: params[:student_temp][:invite_code]
      )
    end

    @student_temp.auth_key = SecureRandom.uuid

    unless @student_temp.save
      @sub_header = {
          title: "登録ページ",
          list: [
              {
                  name: "学生",
                  url: "/student"
              }
          ]
      }

      render("student/new")
    end
  end

  def activate
    @sub_header = {
        title: "登録ページ",
        list: [
            {
                name: "学生",
                url: "/student"
            }
        ]
    }

    @student_temp = StudentTemp.find_by(auth_key: params[:auth_key])
    if @student_temp.nil?
      render :file => "#{Rails.root}/public/404", layout: false, status: :not_found
      return
    end

    @student = Student.new(
        id: @student_temp.student_id,
        email: @student_temp.student_id + "@s.asojuku.ac.jp",
        class_id: @student_temp.class_id
    )
  end

  def create
    student_temp = StudentTemp.find_by(auth_key: params[:auth_key])
    @student = Student.new(
        id: student_temp.student_id,
        email: student_temp.student_id + "@s.asojuku.ac.jp",
        password: params[:password],
        last_name: params[:last_name],
        first_name: params[:first_name],
        last_name_furigana: params[:last_name_furigana],
        first_name_furigana: params[:first_name_furigana],
        class_id: student_temp.class_id,
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

  def edit
    @sub_header = {
        title: "登録ページ",
        list: [
            {
                name: "学生",
                url: "/student"
            }
        ]
    }

    @student = Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])
    @student.email = params[:email]
    @student.last_name = params[:last_name]
    @student.first_name = params[:first_name]
    @student.last_name_furigana = params[:last_name_furigana]
    @student.first_name_furigana = params[:first_name_furigana]
    @student.gender = params[:gender]
    @student.biography = params[:biography]
    if params[:icon]
      @student.icon = "#{@student.id}.jpg"
      image = params[:icon]
      File.binwrite("public/student_icons/#{@student.icon}", image.read)
    end
    if @student.save
      flash[:notice] = "ユーザー情報変更完了しました"
      redirect_to("/student/edit/#{@student.id}")
    else
      render("student/edit")
    end
  end
end
