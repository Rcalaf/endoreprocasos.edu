class Document < ActiveRecord::Base
  attr_accessible :cas_id, :titol, :document, :descripcio
  belongs_to :cas
  
  has_attached_file :document
end
