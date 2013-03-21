class Front::FrontController < ApplicationController
  layout 'front'
  
  before_filter :load_data

  def load_data
    @public_pages = Page.front.order 'position asc'
  end
end