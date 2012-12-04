class Pregunta < ActiveRecord::Base
  attr_accessible :cas_id, :text, :user_id
 
  belongs_to :cas
  belongs_to :user
end
