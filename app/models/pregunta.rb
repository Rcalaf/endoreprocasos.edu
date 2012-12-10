class Pregunta < ActiveRecord::Base
  attr_accessible :cas_id, :text, :user_id
  
  #has_many :respostes,:class_name => "Resposta", :dependent => :destroy
  has_one :resposta, :class_name => "Resposta", :dependent => :destroy
  belongs_to :cas
  belongs_to :user
end
