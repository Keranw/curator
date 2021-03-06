class CoursesController < ApplicationController

  def courses
    @list = Course.return_my_followed_course(session["current_user_id"])
    if @list.nil?
      @list = []
    end
  end

  def my_courses
    @list = Course.return_my_course(session["current_user_id"])
    if @list.nil?
      @list = []
    end
  end

  def import
    redirect_to user_courses_path
  end

  def new_course
  end

  def create
    #params course_name:string course_id:string department:string curator:string
    Course.create_course(params, session[:current_user_id])
    redirect_to user_course_management_path
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
    #params aid:integer
    @aim_atom = Atom.find(params["aid"].to_i)
  end

  def new_item
  end

  def create_atom
    aid = Atom.create_atom(params, session[:current_user_name], session[:current_user_depart])
    Course.insert_atom(params["cid"], aid)
    redirect_to courses_detail_path(:authenticity_token=>form_authenticity_token,:id=>params["cid"])
  end

  def update_atom
    Atom.update_atom(params)
    redirect_to courses_detail_items_path(:authenticity_token=>form_authenticity_token,:aid=>params["aid"])
  end

  def delete_atom
    Atom.delete_atom(params)
    redirect_to courses_detail_path(:authenticity_token=>form_authenticity_token,:id=>params["cid"])
  end

end
