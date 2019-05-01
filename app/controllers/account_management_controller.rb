class AccountManagementController < ApplicationController
  def account_management
  end

  def profile_update
    redirect_to user_account_management_path
  end

  def password_update
    redirect_to user_account_management_path
  end
end
