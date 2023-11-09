class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" #{ENV['SMTP_USER_FROM']})
  layout 'mailer'
end
