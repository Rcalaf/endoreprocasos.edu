class Content < ActiveRecord::Base
  attr_accessible :content_type, :embed_code, :big_image_text, :small_image_text, :page_id, :text
  
  belongs_to :page
  
   acts_as_list :scope => :page

   has_attached_file :image, :styles => { :small => "305x", :big => "640x" }, :convert_options => {:all => ["-strip", "-colorspace RGB"]},:url => "/system/:class/:attachment/:name_:style.:extension"
  
end
