# encoding: UTF-8
class Admin::CasosController < Admin::AdminController
  
  
  def index
    @title = "Endoreprocasos | Casos"
   # @casos = session[:professor_id] ? Cas.all : Cas.this_year
    @casos = Cas.all
    @cas = @casos.first
  end

  def new
    @title = "Endoreprocasos | Nuevo caso"
    @owner = Cas.new
    if request.post? 
      @owner = Cas.create(params[:cas])
      if @cas.valid? 
        redirect_to edit_cas_url(@owner)
      end
    end
  end
  
  def edit
    @owner = Cas.find(params[:cas_id])
    @title = "Endoreprocasos | Editar caso #{@owner.titol}"
    @document = Document.new
    @documents = @owner.documents
    @preguntes = @owner.preguntes
    @contents = @owner.contents
    @content = Content.new(:cas_id => @owner.id)
    if request.put? 
      @owner.update_attributes(params[:cas])
    end
   
  end
  
  def show
    @cas = Cas.find(params[:cas_id])
    @title = "Endoreprocasos | #{@cas.titol}"
    @documents = @cas.documents
    @preguntes = @cas.preguntes
    @contents = @cas.contents
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
