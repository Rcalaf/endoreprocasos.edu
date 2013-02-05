class Cas < ActiveRecord::Base
  attr_accessible :descripcio, :titol

  has_many :preguntes, :class_name => "Pregunta", :dependent => :destroy
  has_many :documents, :dependent => :destroy
  
  scope :today, where("created_at > ?", "#{Time.now.year}-1-1") 
  
end
