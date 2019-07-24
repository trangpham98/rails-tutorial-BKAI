class SendResetMailJob < ApplicationJob
  queue_as :default

  def perform user, reset_token, tempt_password
    UserMailer.password_reset(user, reset_token, tempt_password).deliver_later
  end
end
