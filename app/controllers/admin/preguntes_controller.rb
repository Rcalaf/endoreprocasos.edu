class Admin::PreguntesController < ApplicationController
  def new
    @pregunta = Pregunta.new
    if request.post?
      params[:pregunta][:user_id] = session[:alumne_id]
      params[:pregunta][:cas_id] = params[:cas_id]
      @pregunta = Pregunta.create(params[:pregunta])
      if pregunta.valid? 
        redirect_to show_cas_url(params[:cas_id])
      end
    end
  end
  
  def edit
    @pregunta = Pregunta.find(params[:pregunta_id])
    if request.post?
      @pregunta.update_attributes(params[:pregunta])
    end
  end
  
  def delete
    pregunta = Pregunta.find(params[:pregunta_id])
    cas = pregunta.cas
    if pregunta.destroy
      redirect_to show_cas_url(cas)
    end
  end
  
end
