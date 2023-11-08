class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <f.aziret@bk.ru>)
  layout 'mailer'
end
