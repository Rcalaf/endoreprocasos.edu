module ApplicationHelper
  
  def get_years
    data = []
    Cas.select('year').group(:year).each do |cas|
      data << ["#{cas.year}","#{cas.year}"]
    end
    data << ["#{Time.now.year}","#{Time.now.year}"]
    data.uniq
  end
end
