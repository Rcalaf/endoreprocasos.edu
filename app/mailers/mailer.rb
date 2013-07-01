# encoding: UTF-8
class Mailer < ActionMailer::Base
  default from: 'info@endoreprocasos.es'

  def new_password_mail(user)
    @user = user
    mail(:to => user.email, :subject => "Restablecer contraseña")
  end
  
  def new_user_mail(user)
    @user = user
    mail(:to => user.email, :subject => "Bienvenido a Endoreprocasos.es")
  end
  
  def contact(user)
    @user = user
    mail(:from => user[:email], :to =>'p.lacruz@torrespardo.com', :subject => "Consulta de Endoreprocasos.es")
  end
 
end
