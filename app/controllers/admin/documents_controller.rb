# encoding: UTF-8
class Admin::DocumentsController < Admin::AdminController

  def new
    cas = Cas.find(params[:cas_id])
    if request.post?
      @document = cas.documents.create(params[:document])
      if @document.valid?
        flash[:document] = "Material añadido"
      end
    end
    redirect_to edit_cas_url(cas,:anchor => 'material')
  end
  
  def delete
    document = Document.find(params[:document_id])
    cas = document.cas
    if document.delete
      flash[:document] = "Material eliminado"
      redirect_to edit_cas_url(cas)
    end
  end
end
