class CoursesController < ApplicationController

  def courses
    @list = Course.all
  end

  def import
    redirect_to user_courses_path
  end

  def new_course
  end

  def create
    #params course_name:string course_id:string department:string curator:string
    Course.create_course(params)
    redirect_to user_courses_path
  end

  def update
    #params id:integer course_name:string course_id:string department:string curator:string
    Course.update_course(params)
    redirect_to courses_detail_path(:authenticity_token=>form_authenticity_token,:id=>params["id"])
  end

  def course_detail
    #params course_id:string
    @aim_course = Course.find(params["id"].to_i)
  end

  def item_detail
  end

  def new_item
  end

  def create_atom
    aid = Atom.create_atom(params)
    Course.insert_atom(params["cid"], aid)
    redirect_to courses_detail_path(:authenticity_token=>form_authenticity_token,:id=>params["cid"])
  end

end
