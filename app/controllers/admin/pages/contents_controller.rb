  # encoding: UTF-8
class Admin::Pages::ContentsController < Admin::AdminController
  layout 'application'

  def new
    @page = Page.find(params[:page_id])
    @title = "Nuevo contenido"
    if request.post?
     params[:content][:page_id] = params[:page_id]
     @content = Content.new(params[:content])
       if @content.save
          flash[:content] = "El contenido se ha creado"
          redirect_to edit_page_url(@page,:anchor => "contents")
       end
    else
      @content = Content.new
    end
  end

  def edit
    @page = Page.find(params[:page_id])
    @title = "Editar contenido"
    @content = Content.find(params[:content_id])
    if request.put?
      if @content.update_attributes(params[:content])
        flash[:content] = "El contenido se ha actualizado"
        redirect_to edit_page_url(@page,:anchor => "contents")
      end
    end
    @content_image = ContentImage.new
  end



  def sort
   ApplicationSweeper.sweep
   sort_array = params[:sort_data].split("&")
   sort_array.each_with_index do |content_id,position|
     content_id = content_id.split("=")[1].to_i 
     if Content.update_all(['position=?',position + 1],['id=?',content_id])
       flash[:content] = "El orden se ha actualizado"
     end 
   end
   redirect_to edit_page_url(params[:page_id],:anchor => "contents")
  end

  def destroy
    content = Content.find(params[:content_id])
    flash[:content] = "El contenido se ha borrado" if content.destroy
    redirect_to edit_page_url(params[:page_id],:anchor => "contents")
  end
end

