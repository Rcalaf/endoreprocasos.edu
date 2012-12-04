class Admin::DocumentsController < ApplicationController
  layout 'admin'
  def new
    cas = Cas.find(params[:cas_id])
    @document = Document.new
    if request.post?
      @document = Document.create(params[:document])
      if @document.valid?
        cas.documents << @document
        redirect_to edit_cas_url(cas)
      end
    end
  end
  
  def delete
    document = Document.find(params[:document_id])
    cas = document.cas
    if document.delete
      redirect_to edit_cas_url(cas)
    end
  end
end
