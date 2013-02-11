# encoding: UTF-8
class Document < ActiveRecord::Base
  attr_accessible :cas_id, :titol, :document, :descripcio
  belongs_to :cas
  
  has_attached_file :document
  #validates_attachment_content_type :document, :content_type => ["application/pdf","application/zip"], :message => "Solo se admiten archivos PDF o ZIP (español)", :if => :activate_download_validation
  validates_attachment_presence :document, :message => "Selecciona un archivo."
  validates :descripcio, :presence => {:presence => true,:message => "Escribe una descripción para el documento."}
  validates :titol, :presence => {:presence => true,:message => "Escribe un titulo para el documento."}
  #validates_attachment_size :document, :less_than => 5120000, :message => "El archivo para español es demasiado pesado (5 Mb máximo)", :if => :activate_download_validation
end
