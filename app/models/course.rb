class Course < ApplicationRecord
  def self.create_course(params,id)
    result = Course.create(course_name:params[:course_name], course_id:params[:course_id], department:params[:department], curator:params[:curator])
    aim_user = User.find(id.to_i)
    aim_user["course_list"].push(result["id"])
    aim_user.save!
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

  def self.return_my_course(id)
    aim_user = User.find(id)
    #list = Course.find_all_by_id(aim_user["course_list"])
    list = Course.where(id: aim_user["course_list"])
  end

  def self.search_course(term)
    term = term.strip
    if term.empty?
      []
    else
      # 远端搜索
      # TBD
      # 本地搜索
      result_p1 = []
      result_p2 = []
      Course.all.each do |course|
        if course["course_name"].include?(term.to_s)
          result_p1.push(course)
        elsif course["course_id"].include?(term.to_s)
          result_p2.push(course)
        end
      end
      result = (result_p1 + result_p2).uniq
=begin
    if result.is_a? Course
      result = [result]
    end
    result
=end
    end
  end

end
