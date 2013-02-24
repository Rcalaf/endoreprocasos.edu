class Admin::Pages::ContentsController < Admin::AdminController
  layout 'application'
  
  def create
    @page = Page.find(params[:page_id])
    if request.post?
      
    else
      Content.new  
    end
  end
  
  def edit
  end
  
  def sort
  end
  
  def delete
  end
  

  
end
