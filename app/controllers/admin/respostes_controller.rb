# encoding: UTF-8
class Admin::RespostesController < Admin::AdminController
  def new
    if request.post?
      @resposta = Resposta.create(params[:resposta])
      unless @resposta.valid? 
        flash[:resposta_errors] = @resposta.errors
      end  
      redirect_to show_cas_url(params[:cas_id],:anchor => 'respuestas')
    end
  end
  
  def edit
    @resposta = Resposta.find(params[:resposta_id])
    if request.put?
      if @resposta.update_attributes(params[:resposta])
         redirect_to show_cas_url(params[:cas_id])
      end
    end
  end
  
  def delete
    resposta = Resposta.find(params[:resposta_id])
    cas = resposta.pregunta.cas
    if resposta.destroy
      redirect_to show_cas_url(cas)
    end
  end
end
