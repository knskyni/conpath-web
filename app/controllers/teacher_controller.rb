class TeacherController < ApplicationController
  def new
    @teacher = Teacher.new
    @sub_header = {
        title: "教員登録",
        list: [
            {
                name: "教員登録",
                url: "/teacher/new"
            }
        ]
    }
  end

  def create
    @teacher = Teacher.new(last_name: params[:last_name])
    @teacher = Teacher.new(first_name: params[:first_name])
    @teacher = Teacher.new(last_name_furigana: params[:last_name_furigana])
    @teacher = Teacher.new(first_name_furigana: params[:first_name_furigana])
    @teacher = Teacher.new(email: params[:email])
    @teacher = Teacher.new(password: params[:password])
    @teacher = Teacher.new(gender: params[:gender])
    @teacher = Teacher.new(biography: params[:biography])
    @teacher.save
    redirect_to("/")
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end
end
