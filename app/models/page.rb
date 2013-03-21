# encoding: UTF-8
class Page < ActiveRecord::Base
  attr_accessible :menu_title, :title, :home, :slug, :public
  
  has_many :contents, :dependent => :destroy, :order => 'position asc'
  
  before_validation :set_slug
  after_save :update_home_status
  
  acts_as_list 
  
  scope :admin, where(:public => false)
  scope :front, where(:public => true)
  
  private
  
  def update_home_status
    if self.home
      page = Page.find_by_home(true)
      page.update_attribute(:home,false) if page != self
    end
  end
  
  def set_slug
    self.slug = self.menu_title.parameterize
  end
end
