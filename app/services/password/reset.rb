class Password::Reset
  def initialize user
    @user = user
  end

  def call
    send_reset
  end

private    
  def send_reset
    SendResetMailJob.set(wait: 20.seconds).perform_later @user, @user.reset_token, @user.tempt_password
  end
end