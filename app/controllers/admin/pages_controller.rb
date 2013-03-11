class Admin::PagesController < Admin::AdminController
  layout 'admin'
  
  def index
    @pages = Page.all :order => "position asc"
  end
  
  def new
    
    if request.post?
      @owner = Page.create(params[:page])
      if @owner.valid? 
        redirect_to edit_page_url(@owner)
      end
    end
    @page = Page.new
  end
  
  def edit
    @owner = Page.find(params[:page_id])
    @contents = @owner.contents
    @content = Content.new(:page_id => @owner.id)
    if request.put?
      @owner.update_attributes(params[:page])
    end
  end
  
  def sort
   sort_array = params[:sort_data].split("&")
   sort_array.each_with_index do |content_id,position|
     content_id = content_id.split("=")[1].to_i 
     if Page.update_all(['position=?',position + 1],['id=?',content_id])
       flash[:content] = "El orden se ha actualizado"
     end 
   end
   respond_to do |format|
      format.js { render :layout=>false }
      #format.html 
   end
  end
  
  def delete
    page = Page.find(params[:page_id])
    page.destroy unless page.home
    redirect_to pages_url
  end
  
end
