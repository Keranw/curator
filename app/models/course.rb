class Course < ApplicationRecord
  def self.create_course(params)
    Course.create(course_name:params[:course_name], course_id:params[:course_id], department:params[:department], curator:params[:curator])
  end

  def self.update_course(params)
    aim_course = Course.find(params["id"])
    aim_course["course_name"] = params["course_name"]
    aim_course["course_id"] = params["course_id"]
    aim_course["department"] = params["department"]
    aim_course["curator"] = params["curator"]
    aim_course.save!
  end

  def self.insert_atom(cid,aid)
    aim_course = Course.find(cid)
    aim_course["atoms"].push(aid)
    aim_course.save!
  end

end
