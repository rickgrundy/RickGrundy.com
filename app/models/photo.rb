class Photo < ActiveRecord::Base
  has_and_belongs_to_many :albums
  
  def url
    "http://s3.amazonaws.com/RickGrundy#{self.url_path}/#{self.id}.jpg"
  end
  
  def url_thumb
    "http://s3.amazonaws.com/RickGrundy#{self.url_path}/#{self.id}_thumb.jpg"
  end
  
  def title
    self.title? ? super : "Untitled #{self.id}"
  end
  
  def blurb
    self.blurb? ? super : "This photo does not have a description."
  end
end
