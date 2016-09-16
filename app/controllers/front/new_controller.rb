# encoding: UTF-8
class Front::NewController < ApplicationController
  layout 'new'
  
  def front

    if request.post?
      @consulta = Consulta.create(params[:consulta])
      if @consulta.valid?
        Mailer.contact(@consulta).deliver
        flash[:notice] = "Grácias por contactar con nosotros!"
        @consulta = Consulta.new
      else
        flash[:error] = "Pon un mensaje y un email para enviar el formulario"
      end
      redirect_to root_url( :anchor => 'contacto')
   
    else
      @consulta = Consulta.new
    end
  end
  
  
end
