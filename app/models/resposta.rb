# encoding: UTF-8
class Resposta < ActiveRecord::Base
  attr_accessible :pregunta_id, :text, :user_id
  
  belongs_to :pregunta
  belongs_to :user
  
  validates :text, :presence => {:presence => true,:message => "Escribe un texto para la respuesta."}
  
  def is_owner(id)
    self.user_id == id
  end
end
