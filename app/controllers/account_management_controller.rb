class AccountManagementController < ApplicationController
  def account_management
    @aim_user = User.find(session[:current_user_id])
  end

  def profile_update
    User.update_account(params)
    redirect_to user_account_management_path
  end

  def password_update
    User.update_password(params)
    redirect_to user_account_management_path
  end

  def create_new_account
    result = User.create_account(params)
    if result == false
      flash[:login_error] = "Account existed!"
    else
      flash[:login_error] = "Account created, please login with your new account!"
    end
    redirect_to root_path
  end

  def forget
  end

  def reset
    @aim_user = User.find_by(email:params["email"].downcase)
    if @aim_user.nil?
      flash[:login_error] = "The account doesn't exist!"
      redirect_to user_forget_path
    else
      User.create_reset_token(@aim_user)
      reset_url = 'http://'+ $host + '/password_reset/' + @aim_user["reset_token"] + '/index?email=' + @aim_user[:email].split('@')[0] + '%40' + @aim_user[:email].split('@')[1]
      AccountMailer.password_reset(reset_url, @aim_user["email"], @aim_user["username"]).deliver_later

      flash[:login_error] = "The email with reset link has been sent!"
      redirect_to root_path
    end
  end

  def reset_index
    # params email:string token:string
  end

  def reset_my_password
    # params id:string password1:string
    User.update_password(params)
    flash[:login_error] = "You can login with your new password now!"
    redirect_to root_path
  end
end
