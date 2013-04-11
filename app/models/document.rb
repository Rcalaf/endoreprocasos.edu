# encoding: UTF-8
class Document < ActiveRecord::Base
  attr_accessible :cas_id, :titol, :document, :descripcio
  belongs_to :cas
  
  has_attached_file :document#,:url => "/system/:class/:attachment/:name_:style.:extension"

  
  #validates_attachment_content_type :document, :content_type => ["application/pdf","application/zip"], :message => "Solo se admiten archivos PDF o ZIP (español)", :if => :activate_download_validation
  validates_attachment_size :document, :less_than => 6144000, :message => "Pesado demasiado (5 Mb máximo)"
  validates_attachment_presence :document, :message => "Selecciona archivo"
  validates :titol, :presence => {:presence => true,:message => "Escribe un título"}
 # validates :titol, :length => {:maximum => 25,:message => "Titulo: maximo 25ch."}
  
  
end
