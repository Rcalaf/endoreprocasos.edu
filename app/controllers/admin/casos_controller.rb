# encoding: UTF-8
class Admin::CasosController < ApplicationController
  #layout 'admin'
  layout 'roger'
  def index
    @casos = Cas.all
    @cas = @casos.first
  end

  def new
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
    @document = Document.new
    @documents = @cas.documents
    if request.put? 
      @cas.update_attributes(params[:cas])
    end
  end
  
  def show
    @cas = Cas.find(params[:cas_id])
    @casos = Cas.all
    @documents = @cas.documents
    @preguntes = @cas.preguntes
    @pregunta = Pregunta.new
    @resposta = Resposta.new
  end
  
  def delete
    cas = Cas.find(params[:cas])
    if cas.delete
      redirect_to casos_url
    end
  end
end
