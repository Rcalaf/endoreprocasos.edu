class Front::FrontController < ApplicationController
  layout 'front'
  
  before_filter :load_data, :root_page

  def load_data
    @public_pages = Page.front.order 'position asc'
  end
  
  def root_page
    @root_page = Page.root
  end
end