class TeacherController < ApplicationController
  def new
  end

  def create
    @teacher = Teacher.new(lastName: params[:lastName])
    @teacher = Teacher.new(params[:firstName])
    @teacher = Teacher.new(params[:lastNameFurigana])
    @teacher = Teacher.new(params[:firstNameFurigana])
    @teacher = Teacher.new(params[:email])
    @teacher = Teacher.new(params[:password])
    @teacher = Teacher.new(params[:gender])
    @teacher = Teacher.new(params[:biography])
    @teacher.save
    redirect_to("/teacher/")
  end

end
