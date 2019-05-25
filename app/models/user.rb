class User < ApplicationRecord
  before_save { self.email = email.downcase }

  def self.create_account(params)
    temp = User.find_by(email:params["email"].downcase)
    if temp
      false
    else
      @@type = 0
      if params["atype"].nil?
        @@type = 1
      end
      User.create(utype:@@type, email:params["email"], username:params["username"], password:params["password"], department:params["department"])
    end
  end

  def self.match(email, password)
    aim_user = User.find_by(email:email)
    if aim_user
      if aim_user["password"] == password
        aim_user
      else
        1
      end
    else
      0
    end
  end

  def self.update_account(params)
    aim_user = User.find(params["id"])
    aim_user["username"] = params["username"]
    aim_user["email"] = params["email"]
    aim_user["department"] = params["department"]
    aim_user.save!
  end

  def self.update_password(params)
    aim_user = User.find(params["id"])
    aim_user["password"] = params["password1"]
    aim_user.save!
  end

  def self.follow_course(user_id, course_id)
    aim_user = User.find(params["id"])
    aim_user["course_list"].push(course_id).uniq!
    aim_user.save!
  end

  def self.unfollow_course(user_id, course_id)
    aim_user = User.find(params["id"])
    aim_user["course_list"].delete(course_id)
    aim_user.save!
  end


end
