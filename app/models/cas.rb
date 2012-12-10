class Cas < ActiveRecord::Base
  attr_accessible :descripcio, :titol

  has_many :preguntes, :class_name => "Pregunta", :dependent => :destroy
  has_many :documents, :dependent => :destroy
end
