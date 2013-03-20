# encoding: UTF-8
class Admin::PreguntesController < Admin::AdminController
  layout 'application'
  
  def index
    @preguntes = Pregunta.all
  end
  
  def new
    #jquey
    @pregunta = Pregunta.new
    if request.post?
      @pregunta = Pregunta.create(params[:pregunta])
      unless @pregunta.valid? 
        flash[:errors] = @pregunta.errors
      end
    end
    redirect_to show_cas_url(params[:cas_id], :anchor => 'preguntas')  
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
