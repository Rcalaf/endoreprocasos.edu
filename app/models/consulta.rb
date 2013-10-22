class Consulta < ActiveRecord::Base
  attr_accessible :email, :mensaje, :name
  validates :mensaje, :presence => {:presence => true}
  validates :email, :presence => {:presence => true}
  
end
