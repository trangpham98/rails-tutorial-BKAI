class UserMailer < ApplicationMailer
  def account_activation user, activation_token
    @activation_token = activation_token
    @user =  user
    mail to: user.email, subject: "Account activation!"
  end

  def password_reset user, reset_token, tempt_password
    @user = user
    @reset_token = reset_token
    @tempt_password = tempt_password
    mail to: @user.email, subject: "Reset password"
  end
end
