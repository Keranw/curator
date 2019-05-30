class AccountMailer < ApplicationMailer
  def password_reset(act_link, aim, username)
    @url  = act_link
    @username = username
    mail(to: aim, subject: 'Reset Password')
  end
end
