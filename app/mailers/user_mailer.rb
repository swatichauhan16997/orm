# user mailer
class UserMailer < ApplicationMailer
  def user_registration_mail(user)
    @user = user
    password = SecureRandom.hex(6)
    @user.update_attribute(:password, "#{password}")
    mail(to: @user.email, subject: 'Website-Credentials')
  end
end
