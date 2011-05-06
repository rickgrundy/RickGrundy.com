class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
    @album = @photo.albums.first
    photos = @album.sorted_photos
    this_index = photos.index(@photo)
    @previous_photo = photos[this_index - 1] unless this_index == 0
    @next_photo = photos[this_index + 1]
    @page_title = "#{@album.name} - #{@photo.title} | Rick Grundy"
  end
end
