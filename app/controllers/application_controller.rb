class ApplicationController < ActionController::Base
  before_action :authenticate

  def initialize
    @sub_header = {
        title: "タイトルなし",
        list: []
    }

    @custom_css = []
    @custom_js = []

    super
  end

  def authenticate
    if session[:user_type]
      if session[:user_type] == "student"
        @current_user = Student.find_by(id: session[:user_id])
      elsif session[:user_type] == "teacher"
        @current_user = Teacher.find_by(id: session[:user_id])
      end
    end
  end

  def set_sub_header_title(title)
    @sub_header[:title] = title
  end

  def add_sub_header_path(name, url)
    @sub_header[:list].push({name: name, url: url})
  end

  def add_custom_css(path)
    @custom_css.push(path)
  end

  def add_custom_js(path)
    @custom_js.push(path)
  end

  def render_404
    render(file: "#{Rails.root}/public/404", layout: false, status: :not_found)
  end

  def check_login
    if @current_user.nil?
      flash[:notice] = "ログインしてください。"
      redirect_to("/student/login")
    end
  end

  def check_student
    if session[:user_type] != "student"
      flash[:notice] = "このページは学生のみアクセスできます。"
      redirect_to("/")
    end
  end

  def check_teacher
    if session[:user_type] != "teacher"
      flash[:notice] = "このページは教員のみアクセスできます。"
      redirect_to("/")
    end
  end
end
