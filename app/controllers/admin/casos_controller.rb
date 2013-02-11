# encoding: UTF-8
class Admin::CasosController < Admin::AdminController
  layout 'roger'
  
  def index
    @title = "Endoreprocasos | Casos"
   # @casos = session[:professor_id] ? Cas.all : Cas.this_year
    @casos = Cas.all
    @cas = @casos.first
  end

  def new
    @title = "Endoreprocasos | Nuevo caso"
    @cas = Cas.new
    if request.post? 
      @cas = Cas.create(params[:cas])
      if @cas.valid? 
        redirect_to edit_cas_url(@cas)
      end
    end
  end
  
  def edit
    @cas = Cas.find(params[:cas_id])
    @title = "Endoreprocasos | Editar caso #{@cas.titol}"
    @document = Document.new
    @documents = @cas.documents
    @preguntes = @cas.preguntes
    if request.put? 
      @cas.update_attributes(params[:cas])
    end
  end
  
  def show
    @cas = Cas.find(params[:cas_id])
    @title = "Endoreprocasos | #{@cas.titol}"
    @casos = Cas.all
    @documents = @cas.documents
    @preguntes = @cas.preguntes
    @pregunta = Pregunta.new
    @resposta = Resposta.new
  end
  
  def delete
    cas = Cas.find(params[:cas_id])
    if cas.delete
      redirect_to casos_url
    end
  end
end
