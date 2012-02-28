class Photo < ActiveRecord::Base
  has_and_belongs_to_many :albums
  acts_as_list

  has_attached_file :image, {
    :whiny => true,
    :storage => :s3,
    :s3_credentials => {
      :access_key_id => ENV["S3_KEY"],
      :secret_access_key => ENV["S3_SECRET"]
    },
    :s3_host_alias => Rails.env.production? ? 'cdn.rickgrundy.com' : nil,
    :url => ':s3_alias_url',
    :bucket => "rickgrundy-#{Rails.env}",
    :path => "images/:style/:id.:extension",
    :styles => { 
      :full => "930x620>",
      :thumbnail => "162x162#",
      :frontpage => "290x160#"
    }
  }    
  
  def path
    "/photo/#{self.id}/#{self.title.urlify}"
  end
  
  def title
    self.title? ? super : "Untitled #{self.id}"
  end
  
  def blurb
    self.blurb? ? super : "This photo does not have a description."
  end
end
