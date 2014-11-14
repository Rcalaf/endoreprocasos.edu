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
  
  def contact(consulta)
    @consulta = consulta
    mail(:from => consulta.email, :to =>'t.avidad@torrespardo.com', :cc => 'rcalaf.cot@gmail.com', :subject => "Consulta de Endoreprocasos.es")
  end
  


end
