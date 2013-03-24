# encoding: UTF-8
class Cas < ActiveRecord::Base
  attr_accessible :descripcio, :titol, :year

  has_many :preguntes, :class_name => "Pregunta", :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_many :contents, :dependent => :destroy, :order => 'position asc'
  
  scope :this_year, where("created_at > ?", "#{Time.now.year}-1-1") 
  
 # validates :ti, :presence => {:presence => true,:message => "Escribe un email", :if => :enable_email_validations}
 # validates :email, :uniqueness => {:uniqueness => true,:message => "Ya existe un usuario con este email",:if => :enable_email_validations}
  
end
