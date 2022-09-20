class ApplicationMailer < ActionMailer::Base
  default from: 'wadenaughton@gmail.com'
  layout 'mailer'

  def forgot_password(user)
    @user = user
    @greeting = "Hi"
    
    mail to: user.email, :subject => 'Reset password instructions'
  end
end
