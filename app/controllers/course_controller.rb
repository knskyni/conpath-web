class CourseController < ApplicationController
  def new
    @course = Course.new(school_id: params[:school_id])
  end

  def create

  end
end
