# encoding: UTF-8
class Pregunta < ActiveRecord::Base
  attr_accessible :cas_id, :text, :user_id, :owner_name
  
  has_many :respostes,:class_name => "Resposta", :dependent => :destroy
  belongs_to :cas
  belongs_to :user
  
  validates :text, :presence => {:presence => true,:message => "Escribe un texto para la pregunta."}
  
  def is_owner(id)
    self.user_id == id
  end
end
