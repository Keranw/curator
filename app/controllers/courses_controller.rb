class CoursesController < ApplicationController
  def courses
  end

  def import
    redirect_to user_courses_path
  end

  def new_course
  end

  def create
    redirect_to user_courses_path
  end

  def course_detail
    #params course_id:string
  end

  def item_detail
  end
end
