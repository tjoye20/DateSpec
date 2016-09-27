class UserMailer < ApplicationMailer
  default from: 'DateSpec@noreply.com'

  def new_admirer_email(username, email)
    @user = username
    @login_url = "https://agile-sierra-37368.herokuapp.com/login"
    mail(to: email, subject: 'DateSpec: New Admirer!')
  end
end
