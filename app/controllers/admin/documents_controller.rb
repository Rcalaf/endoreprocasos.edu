class Admin::DocumentsController < Admin::AdminController
  layout 'admin'
  def new
    cas = Cas.find(params[:cas_id])
    if request.post?
      @document = Document.create(params[:document])
      if @document.valid?
        cas.documents << @document
      else
        flash[:errors] = @document.errors
      end
      
    end
    redirect_to edit_cas_url(cas,:anchor => 'material')
  end
  
  def delete
    document = Document.find(params[:document_id])
    cas = document.cas
    if document.delete
      redirect_to edit_cas_url(cas)
    end
  end
end
