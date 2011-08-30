class PopulatePaperclipInfoForExistingImages < ActiveRecord::Migration
  def self.up
    now = Time.now
    Photo.find_each do |photo|
      photo.image_updated_at = now
      photo.image_content_type = "image/jpeg"
      photo.image_file_name = "#{photo.id}.jpg"
      photo.image_file_size = 150000
      photo.save!
    end
  end

  def self.down
  end
end
