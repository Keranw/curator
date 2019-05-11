class UserController < ApplicationController
  def index
  end

  def login
    # params username:string password:string
    puts params["password"]
    if params["username"] == "educator" && params["password"] == "educator"
      session[:account_type] = "educator"
      redirect_to user_dashboard_path
    elsif params["username"] == "curator" && params["password"] == "curator"
      session[:account_type] = "curator"
      redirect_to user_dashboard_path
    else
      flash[:login_error] = "Please conform and try again!"
      redirect_to root_path
    end
=begin
    params["email"] = params["email"].downcase
    aim_user = User.find_by(email: params[:email])
    if aim_user&&aim_user.authenticate(params[:password])
      redirect_to user_dashboard_path
    else
      flash[:login_error] = "Please conform and try again!"
      redirect_to root_path
    end
=end
  end

  def logout
    flash[:login_error] = "Logout successfully!"
    session[:account_type] = ""
    redirect_to root_path
  end

  def recommends
  end

end
