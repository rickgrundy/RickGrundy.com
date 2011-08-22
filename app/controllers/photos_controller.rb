class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id])
    @album = @photo.albums.first
    this_index = @album.photos.index(@photo)
    @previous_photo = @album.photos[this_index - 1] unless this_index == 0
    @next_photo = @album.photos[this_index + 1]
    @page_title = "#{@album.name} - #{@photo.title} | Rick Grundy"
  end
end
