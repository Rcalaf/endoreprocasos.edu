class Admin::RespostesController < Admin::AdminController
  def new
    @resposta = Resposta.new
    if request.post?
      @resposta = Resposta.create(params[:resposta])
      if @resposta.valid? 
        redirect_to edit_cas_url(params[:cas_id])
      end
    end
  end
  
  def delete
    resposta = Resposta.find(params[:resposta_id])
    cas = resposta.pregunta.cas
    if resposta.destroy
      redirect_to edit_cas_url(cas)
    end
  end
end
