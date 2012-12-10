# encoding: UTF-8
class Mailer < ActionMailer::Base
  default from: 'noreply@endoreprocasos.net'

  def new_password_mail(user)
    @user = user
    mail(:to => user.email, :subject => "Restablir clau d'accés")
  end
 
end
