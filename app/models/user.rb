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
end
