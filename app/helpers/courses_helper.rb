module CoursesHelper
  def return_relationship(course_id, user_id)
    aim_user = User.find(user_id)
    if aim_user["course_list"].include?(course_id.to_i)
      0
    elsif aim_user["follow_course_list"].include?(course_id.to_i)
      1
    else
      2  
    end
  end

end
