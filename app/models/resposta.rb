class Resposta < ActiveRecord::Base
  attr_accessible :pregunta_id, :text, :user_id
end
