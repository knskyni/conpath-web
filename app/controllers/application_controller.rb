class ApplicationController < ActionController::Base
  def authenticate
    if session[:user_type]
      if session[:user_type] == :student
        @current_user = Student.find_by(id: session[:user_id])
      elsif session[:user_type] == :teacher
        @current_user = Teacher.find_by(id: session[:user_id])
      end
    end
  end
end
