class Content < ActiveRecord::Base
  attr_accessible :mini_text, :text
  
  belongs_to :page
end
