class UserMailer < ApplicationMailer
  default from: 'DateSpec@noreply.com'

  def new_admirer_email(username, email)
    @user = username
    @login_url = "http://localhost:3000/login"
    mail(to: email, subject: 'DateSpec: New Admirer!')
  end
end
