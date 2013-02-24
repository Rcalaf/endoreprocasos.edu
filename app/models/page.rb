class Page < ActiveRecord::Base
  attr_accessible :menu_title, :title
  
  has_many :contents, :dependent => :destroy
  
  after_save :update_home_status
  
  private
  
  def update_home_status
    if self.home
      page = Page.find_by_home(true)
      page.update_attribute(:home,false)
    end
  end
end
