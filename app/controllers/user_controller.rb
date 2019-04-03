class UserController < ApplicationController
  def index
  end

  def login
    # params username:string password:string
    puts params["password"]
    if params["username"] == "educator" && params["password"] == "educator"
      session[:account_type] = "educator"
      redirect_to user_dashboard_path
    elsif params["username"] == "student" && params["password"] == "student"
      session[:account_type] = "student"
      redirect_to user_dashboard_path
    else
      flash[:login_error] = "Please conform and try again!"
      redirect_to root_path
    end
  end

  def logout
    flash[:login_error] = "Logout successfully!"
    session[:account_type] = ""
    redirect_to root_path
  end

  def dashboard
  end

  def account_management
  end

  def recommends
  end

  def notifications
  end

  def import
    redirect_to user_metadata_path
  end

end
