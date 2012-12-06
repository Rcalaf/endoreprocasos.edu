class Pregunta < ActiveRecord::Base
  attr_accessible :cas_id, :text, :user_id
  
  has_many :respostes, :dependent => :destroy
  
  belongs_to :cas
  belongs_to :user
end
