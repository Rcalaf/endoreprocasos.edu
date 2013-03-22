# encoding: UTF-8
class Setting < ActiveRecord::Base
  attr_accessible :footer, :front_footer, :main_title, :subtitle, :footer_logo, :logo
  
  has_attached_file :footer_logo, :styles => { :small => "305x", :big => "640x" }, :convert_options => {:all => ["-strip", "-colorspace RGB"]}
  has_attached_file :logo, :styles => { :small => "305x", :big => "640x" }, :convert_options => {:all => ["-strip", "-colorspace RGB"]}
  
end
