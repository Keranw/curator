module DashboardHelper
  def follow_state(course_id, user_id)
    aim_user = User.find(user_id)
    if aim_user["follow_course_list"].include?(course_id.to_i)
      true
    else
      false
    end
  end

end
