# encoding: UTF-8
class Cas < ActiveRecord::Base
  attr_accessible :descripcio, :titol, :year

  has_many :preguntes, :class_name => "Pregunta", :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_many :contents, :dependent => :destroy, :order => 'position asc'
  
  scope :this_year, where("created_at > ?", "#{Time.now.year}-1-1") 
  
  validates :titol, :presence => {:presence => true,:message => "Escribe un título"}
  validates :titol, :uniqueness => {:uniqueness => true,:message => "Éste título ya existe"}
  validates :year, :presence => {:presence => true,:message => "Escoge un año"}  
  
end
