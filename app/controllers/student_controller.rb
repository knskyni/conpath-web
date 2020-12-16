class StudentController < ApplicationController
  before_action :check_login, {only: [:logout, :edit, :update, :favorite_edit, :favorite_list, :password_edit, :password_update]}
  before_action :check_student, {only: [:logout, :edit, :update, :favorite_edit, :favorite_list, :password_edit, :password_update]}

  def login
    render(layout: false)
  end

  def auth
    @student = Student.find_by(email: params[:email])

    if @student && @student.authenticate(params[:password])
      session[:user_type] = "student"
      session[:user_id] = @student.id
      flash[:notice] = "ログインしました。"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています。"
      @email = params[:email]
      render("student/login", layout: false)
    end
  end

  def logout
    session[:user_type] = nil
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/student/login")
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

    if @student_temp.save
      StudentMailer.verify(@student_temp).deliver_now

      # サブヘッダー
      set_sub_header_title("仮登録完了")
      add_sub_header_path("学生", nil)
      add_sub_header_path("登録", nil)
    else
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
    @student_temp = StudentTemp.find_by(auth_key: params[:auth_key])
    @student = Student.new(
        id: @student_temp.student_id,
        email: @student_temp.student_id + "@s.asojuku.ac.jp",
        password: params[:password],
        last_name: params[:last_name],
        first_name: params[:first_name],
        last_name_furigana: params[:last_name_furigana],
        first_name_furigana: params[:first_name_furigana],
        class_id: @student_temp.class_id,
        gender: params[:gender],
        icon: "/assets/media/users/blank.png",
    )
    if params[:password] != params[:password_confirmation]
      @error_message = "パスワードが一致しません"
    end

    if @error_message.nil? and @student.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/student/login")
    else
      render("student/activate")
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

    add_custom_js("/assets/js/pages/crud/file-upload/image-input.js")
    @student = Student.find_by(id: @current_user.id)
  end

  def update
    @student = Student.find_by(id: @current_user.id)
    @student.email = params[:email]
    @student.last_name = params[:last_name]
    @student.first_name = params[:first_name]
    @student.last_name_furigana = params[:last_name_furigana]
    @student.first_name_furigana = params[:first_name_furigana]
    @student.gender = params[:gender]
    @student.biography = params[:biography]
    if params[:icon]
      image_name = "/assets/media/users/student/#{@student.id}.jpg"
      image_bin = params[:icon]
      @student.icon = "#{image_name}?v=#{Time.now.to_i}"
      File.binwrite("public#{image_name}", image_bin.read)
    end
    if @student.save
      flash[:notice] = "ユーザー情報変更完了しました"
      redirect_to("/student/my/edit")
    else
      render("student/edit")
    end
  end

  def favorite_edit
    @favorite = RecruitStudentCompanyFavorite.find_by(student_id: @current_user.id,company_id: params[:id])
    if @favorite
      @favorite.destroy
      render json: { action: 'destroy' } ,layout: false
    else
      @favorite = RecruitStudentCompanyFavorite.new(
          student_id: @current_user.id,
          company_id: params[:id]
      )
      if @favorite.save
        render json: { action: 'add' },layout: false
      else
        render status: 400,layout: false
      end
    end
  end

  def favorite_list
    @favorites = RecruitStudentCompanyFavorite.where(student_id: @current_user.id)
  end

  def password_edit
    @sub_header = {
        title: "パスワード変更ページ",
        list: [
            {
                name: "学生",
                url: "/student"
            }
        ]
    }
    @student = Student.find_by(id: @current_user.id)
  end

  def password_update
    @student = Student.find_by(id: @current_user.id)

    @error_messages = []

    unless @student.authenticate(params[:password])
      @error_messages.push("現在のパスワードが違います")
    end

    if params[:new_password] != params[:password_confirm]
      @error_messages.push("パスワードが一致しません")
    end

    @student.password = params[:new_password]

    if @student.save and not @error_messages.any?
      flash[:notice] = "パスワードを変更しました"
      redirect_to("/student/new")
    else
      render("student/password_edit")
    end

  end

  def recruit_profile
    @student = Student.find_by(id: @current_user.id)
    @company_categories = RecruitCompanyCategory.all
    @job_categories = RecruitJobCategory.all
    @student_company_categories = RecruitFavoriteStudentIndustry.where(student_id:@student.id).pluck(:industry_id)
    @student_job_categories = RecruitFavoriteStudentJobCategory.where(student_id: @student.id).pluck(:job_category_id)

    # サブヘッダー
    set_sub_header_title("就活プロファイル")
    add_sub_header_path("プロフィール", "/student/#{@student.id}")
    add_sub_header_path("就活プロファイル", nil)

    add_custom_js("/assets/js/pages/student/recruit_profile.js")
  end

  def recruit_profile_update
    # 業種
    param_company_categories = params[:company_categories]
    RecruitFavoriteStudentIndustry.where(student_id: @current_user.id).destroy_all
    if param_company_categories
      param_company_categories.each do |param_company_category|
        company_category = RecruitCompanyCategory.find_by(id: param_company_category)
        RecruitFavoriteStudentIndustry.new(student_id: @current_user.id, industry_id: company_category.id).save if company_category
      end
    end

    # 職種
    param_job_categories = params[:job_categories]
    RecruitFavoriteStudentJobCategory.where(student_id: @current_user.id).destroy_all
    if param_job_categories
      param_job_categories.each do |param_job_category|
        job_category = RecruitJobCategory.find_by(id: param_job_category)
        RecruitFavoriteStudentJobCategory.new(student_id: @current_user.id, job_category_id: job_category.id).save if job_category
      end
    end

    flash[:notice] = "就活プロファイルを更新しました。"
    redirect_to("/student/my/recruit_profile")
  end
end
