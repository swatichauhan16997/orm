# Mailer class for application
class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL_USERNAME']
  layout 'mailer'
end
