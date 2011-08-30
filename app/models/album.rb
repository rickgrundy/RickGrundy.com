class Album < ActiveRecord::Base  
  has_and_belongs_to_many :photos, :order => :position
  belongs_to :cover_image, :class_name => "Photo"
  acts_as_list
  
  def Album.find_by_name(camelized_name)
    albums = Album.find(:all)
	  albums.find{|album| album.name.gsub(' ', '').upcase == camelized_name.upcase}
  end
  
  def path
    "/#{self.name.urlify}"
  end
  
  def name
    self.name? ? super : "Untitled Album #{self.id}"
  end
  
  def blurb
    self.blurb? ? super : "This album does not have a description."
  end
end