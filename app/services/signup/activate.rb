class Signup::Activate
  def initialize user
    @user = user
  end

  def send_mail_activate_service
    SendMailActivateJob.set(wait: 30.seconds).perform_later @user, @user.activation_token
  end   
end
