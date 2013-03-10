class Admin::PagesController < Admin::AdminController
  layout 'admin'
  
  def index
    @pages = Page.all
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
  
  def delete
    page = Page.find(params[:page_id])
    page.destroy unless page.home
    redirect_to pages_url
  end
  
end
