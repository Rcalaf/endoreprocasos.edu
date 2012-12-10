class Admin::PreguntesController < Admin::AdminController
  layout 'roger'
  
  def index
    @preguntes = Pregunta.all
  end
  
  def new
    @pregunta = Pregunta.new
    if request.post?
      @pregunta = Pregunta.create(params[:pregunta])
      if @pregunta.valid? 
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
  
  def show
    @pregunta = Pregunta.find(params[:pregunta_id])
    @respostes = @pregunta.respostes
  end
  
  def delete
    pregunta = Pregunta.find(params[:pregunta_id])
    cas = pregunta.cas
    if pregunta.destroy
      redirect_to show_cas_url(cas)
    end
  end
  
end
