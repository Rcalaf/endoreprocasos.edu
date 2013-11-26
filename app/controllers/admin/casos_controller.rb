# encoding: UTF-8
class Admin::CasosController < Admin::AdminController
  
  
  def index
    @title = "Endoreprocasos | Casos"
    @casos =  (@user.status == 'admin' ? Cas.all : Cas.active)
    @cas = @casos.first
  end

  def new
    @title = "Endoreprocasos | Nuevo caso"
    @owner = Cas.new
    if request.post? 
      @owner = Cas.create(params[:cas])
      if @owner.valid? 
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
      flash[:caso] = "Los cambios se han guardado" if @owner.update_attributes(params[:cas])
    end
   
  end
  
  def show
    @owner = Cas.find(params[:cas_id])
    @title = "Endoreprocasos | #{@owner.titol}"
    @documents = @owner.documents
    @preguntes = @owner.preguntes
    @contents = @owner.contents
    @pregunta = Pregunta.new(:cas_id => @owner.id,:user_id => session[:user_id])
    @resposta = Resposta.new
  end
  
  def delete
    cas = Cas.find(params[:cas_id])
    if cas.delete
      redirect_to casos_url
    end
  end
end
