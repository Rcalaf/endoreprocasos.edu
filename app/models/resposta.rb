class Resposta < ActiveRecord::Base
  attr_accessible :pregunta_id, :text, :user_id
  
  belongs_to :pregunta
  belongs_to :user
end
