# encoding: UTF-8
class Content < ActiveRecord::Base
  attr_accessible :content_type, :embed_code, :image , :page_id, :text, :cas_id
  
  belongs_to :page
  belongs_to :cas
  
  acts_as_list :scope => :page
  acts_as_list :scope => :cas

  has_attached_file :image, :styles => { :small => "305x", :big => "640x" }, :convert_options => {:all => ["-strip", "-colorspace RGB"]}
  validates_attachment_size :document, :less_than => 5120000, :message => "Pesado demasiado (5 Mb máximo)", :if => :enable_image_validation
  validates_attachment_presence :document, :message => "Selecciona un archivo.", :if => :enable_image_validation
  validates :text, :presence => {:presence => true,:message => "Escribe un texto"},:if => :enable_text_validation
  validates :embed_code, :presence => {:presence => true,:message => "Escribe un fragmento de codigo"},:if => :enable_embed_validation
  
  
  
  def owner
    self.cas.nil? ? self.page : self.cas
  end
  
  def owner_class
    self.cas.nil? ? self.page.class : self.cas.class
  end

  private
  
  def enable_text_validation
    self.status == "text"
  end
  
  def enable_image_validation
    self.status == "image"
  end
  
  def enable_embed_validation
    self.status == "embed"
  end
end
