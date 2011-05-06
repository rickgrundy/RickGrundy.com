class Album < ActiveRecord::Base  
  has_and_belongs_to_many :photos
  
  def Album.find_by_name(camelized_name)
    albums = Album.find(:all)
	  albums.find{|album| album.name.gsub(' ', '').upcase == camelized_name.upcase}
  end
  
  def name
    self.name? ? super : "Untitled Album #{self.id}"
  end
  
  def blurb
    self.blurb? ? super : "This album does not have a description."
  end

  def thumbnail_url
    "http://s3.amazonaws.com/RickGrundy/photos/album_thumbnails/#{self.id}.jpg"
  end
  
  def sorted_photos
    self.photos.sort{|a, b| (a.taken && b.taken) ? (a.taken <=> b.taken) : (a.id <=> b.id)}
  end
end
