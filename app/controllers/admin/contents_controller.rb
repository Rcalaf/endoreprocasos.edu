# encoding: UTF-8
class Admin::ContentsController < ApplicationController


  def new
   # @owner = params[:owner_type] == "Page" ? Page.find(params[:owner_id]) : Cas.find(params[:owner_id])
   @owner = set_owner(params[:owner_type])
    @title = "Nuevo contenido"
    if request.post?
     @content = Content.new(params[:content])
       if @content.save
          flash[:content] = "El contenido se ha creado"
          #redirect_to params[:owner_type] == "Page" ? edit_page_url(@owner,:anchor => "contents") : edit_cas_url(@owner)
          redirect_to set_redirection_url(params[:owner_type])
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
   sort_array = params[:sort_data].split("&")
   sort_array.each_with_index do |content_id,position|
     content_id = content_id.split("=")[1].to_i 
     if Content.update_all(['position=?',position + 1],['id=?',content_id])
       flash[:content] = "El orden se ha actualizado"
     end 
   end
   respond_to do |format|
      format.js { render :layout=>false }
      #format.html 
   end
  end

  def destroy
    content = Content.find(params[:content_id])
    url = self.send("edit_#{content.owner_class.to_s.downcase}_url",content.owner.id,:anchor => "contents")
    flash[:content] = "El contenido se ha borrado" if content.destroy
    redirect_to url
  end
  
  private
  
  def set_owner(owner_type)
    case owner_type
    when "Page"
      Page.find(params[:owner_id]) 
    when "Cas"
      Cas.find(params[:owner_id])
    else
      User.find(params[:owner_id])
    end
  end
  
  def set_redirection_url(owner_type)
     case owner_type
      when "Page"
        edit_page_url(@owner,:anchor => "contents")
      when "Cas"
        edit_cas_url(@owner)
      else
        edit_user_url(@owner,:anchor => "contents")
      end
  end
end
