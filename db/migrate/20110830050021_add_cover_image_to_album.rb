class AddCoverImageToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :cover_image_id, :integer, :default => 1
  end

  def self.down
    remove_column :albums, :cover_image_id
  end
end