module UserHelper
  def return_user_id(email)
    aim_user = User.find_by(email:email)
    aim_user["id"].to_i
  end
end
