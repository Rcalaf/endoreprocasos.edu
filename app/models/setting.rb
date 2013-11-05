# encoding: UTF-8
class Setting < ActiveRecord::Base
  attr_accessible :footer, :front_footer, :main_title, :subtitle, :footer_logo, :logo, :main_description
  
  has_attached_file :footer_logo, :styles => { :small => "500x", :big => "800x" }, :convert_options => {:all => ["-strip"]}
  has_attached_file :logo, :styles => { :small => "150x" }, :convert_options => {:all => ["-strip", "-colorspace RGB"]}
  
end
