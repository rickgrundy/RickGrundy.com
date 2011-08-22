class RemoveExifData < ActiveRecord::Migration
  def self.up
    remove_column :photos, :taken
    remove_column :photos, :aperture
    remove_column :photos, :exposure
    remove_column :photos, :iso
    remove_column :photos, :focal_length
    remove_column :photos, :camera
  end

  def self.down
  end
end
