class SendMailActivateJob < ApplicationJob
  queue_as :default

  def perform user, activation_token
    UserMailer.account_activation(user, activation_token).deliver_later
  end
end
