# encoding: UTF-8
class Page < ActiveRecord::Base
  attr_accessible :menu_title, :title, :home, :slug, :public, :description
  
  has_many :contents, :dependent => :destroy, :order => 'position asc'
  
  before_validation :set_slug
  after_save :update_home_status
  
  acts_as_list 
  
  validates :title, :presence => {:presence => true,:message => "Escribe un título"}
  validates :menu_title, :presence => {:presence => true,:message => "Escribe un título para el menú"}
  
  scope :admin, where(:public => false, :home => false)
  scope :front, where(:public => true)

  def self.root
    Page.where(home: true).first
  end
  
  private
  
  def update_home_status
    if self.home
      pages = Page.find_all_by_home(true)
      pages.each do |page|
        page.update_attribute(:home,false) if page != self
      end
    end
  end
  
  def set_slug
    self.slug = self.menu_title.parameterize
  end
end
