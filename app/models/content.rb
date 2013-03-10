class Content < ActiveRecord::Base
  attr_accessible :content_type, :embed_code, :image , :page_id, :text, :cas_id
  
  belongs_to :page
  belongs_to :cas
  
  #before_validation :set_type
  
  #acts_as_list :scope => :page
 # acts_as_list :scope => :cas

  has_attached_file :image, :styles => { :small => "305x", :big => "640x" }, :convert_options => {:all => ["-strip", "-colorspace RGB"]}
  
  private 
  
  def set_type
    if self.text
      self.content_type = 'text'
    elsif self.image
      self.content_type = 'image'
    else
      self.content_type = 'embed'
    end
  end
  
end
