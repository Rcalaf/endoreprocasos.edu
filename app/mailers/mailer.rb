# encoding: UTF-8
class Mailer < ActionMailer::Base
  default from: 'info@endoreprocasos.es'

  def new_password_mail(user)
    @user = user
    mail(:to => user.email, :subject => "Restablir clau d'accés")
  end
 
end
