class Group < ActiveRecord::Base
  attr_accessible :name, :number
  
  has_many :users
end
