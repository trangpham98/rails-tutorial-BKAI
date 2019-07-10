class ApplicationMailer < ActionMailer::Base
  default from: ENV['USER_EMAIL_SMTP']
  layout 'mailer'
end
