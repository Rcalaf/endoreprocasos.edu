class Cas < ActiveRecord::Base
  attr_accessible :descripcio, :titol
  
  has_many :posts, :dependent => :destroy
  has_many :documents, :dependent => :destroy
end
