class DeleteUnusedColumnsPostS3 < ActiveRecord::Migration
  def self.up
    remove_column :photos, :folder_path
    remove_column :photos, :url_path
  end

  def self.down
    add_column :photos, :folder_path, :string
    add_column :photos, :url_path, :string
  end
end
