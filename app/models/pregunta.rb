# encoding: UTF-8
class Pregunta < ActiveRecord::Base
  attr_accessible :cas_id, :text, :user_id
  
  has_many :respostes,:class_name => "Resposta", :dependent => :destroy
  belongs_to :cas
  belongs_to :user
  
  validates :text, :presence => {:presence => true,:message => "Escribe un texto para la pregunta."}
end
