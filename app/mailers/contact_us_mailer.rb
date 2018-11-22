# Mailer class for application
class ContactUsMailer < ApplicationMailer
  def inquiry(user_id, subject, comment)
    @user_id = user_id
    @comment = comment
    @subject = subject
    mail to: [@user.email], subject: "Inquiry for #{@subject}."
  end
end
