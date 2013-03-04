class Admin::PagesController < Admin::AdminController
  layout 'application'
  
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
    if request.post?
      @page = Page.create(params[:page])
      if @page.valid? 
        redirect_to edit_page_url(@page)
      end
    end
  end
  
  def edit
    @page = Page.find(params[:page_id])
    @contents = @page.contents
    if request.put?
      @page.update_attributes(params[:page])
    end
  end
  
  def delete
    page = Page.find(params[:page_id])
    page.destroy unless page.home
    redirect_to pages_url
  end
  
end
