class UserController < ApplicationController
  def index
=begin
    bigquery = Google::Cloud::Bigquery.new project: "bigquery-public-data"

    puts bigquery.datasets.count #=> 1
    puts bigquery.datasets.first.dataset_id #=> "samples"

    puts dataset = bigquery.datasets.first
    puts tables = dataset.tables

    puts tables.count #=> 7
    puts tables.map &:table_id #=> [..., "shakespeare", "trigrams", "wikipedia"]
=end
  end

  def sidebar
  end

  def login
    # params username:string password:string
    result = User.match(params["email"],params["password"])
    if result == 0
      flash[:login_error] = "The account does not exist!"
      redirect_to root_path
    elsif result == 1
      flash[:login_error] = "Please confirm and try again!"
      redirect_to root_path
    else
      if result["utype"] == 0
        session[:account_type] = "curator"
        session[:current_user_id] = result["id"]
        session[:current_user_name] = result["username"]
        session[:current_user_depart] = result["department"]
        redirect_to user_dashboard_path
      else
        session[:account_type] = "educator"
        session[:current_user_id] = result["id"]
        session[:current_user_name] = result["username"]
        session[:current_user_depart] = result["department"]
        redirect_to user_dashboard_path
      end
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

  def new
  end

  def recommends
  end

  def follow_course
    User.follow_course(params["user_id"], params["course_id"])
    redirect_to courses_detail_path(:authenticity_token=>form_authenticity_token,:id=>params["course_id"])
  end

  def unfollow_course
    User.unfollow_course(params["user_id"], params["course_id"])
    redirect_to courses_detail_path(:authenticity_token=>form_authenticity_token,:id=>params["course_id"])
  end

end
