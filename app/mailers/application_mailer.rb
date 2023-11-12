class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_USER_FROM']
  layout 'mailer'
end
