# encoding: UTF-8
class Front::NewController < ApplicationController
  layout 'new'
  
  def test
    if request.post?
      @consulta = Consulta.create(params[:consulta])
      if @consulta.valid?
        Mailer.contact(@consulta).deliver
        flash.now[:notice] = "Grácias por contactar con nosotros!"
        @consulta = Consulta.new
      else
        flash.now[:error] = "Pon un mensaje y un email para enviar el formulario"
      end
    else
      @consulta = Consulta.new
    end
  end
  
  
end
