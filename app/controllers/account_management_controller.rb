class AccountManagementController < ApplicationController
  def account_management
  end

  def profile_update
    redirect_to user_account_management_path
  end

  def password_update
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
end
