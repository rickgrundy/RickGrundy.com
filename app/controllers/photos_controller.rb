class PhotosController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
    
  def show
    @photo = Photo.find(params[:id])
    @album = @photo.albums.first
    this_index = @album.photos.index(@photo)
    @previous_photo = @album.photos[this_index - 1] unless this_index == 0
    @next_photo = @album.photos[this_index + 1]
    @page_title = "#{@album.name} - #{@photo.title} | Rick Grundy"
  end
  
	def update
    Photo.find(params[:id]).update_attributes!(params[:field] => params[:value])
	  render :text => params[:value]
	end
	
	def sort
    Photo.all.each do |photo|
      photo.position = params[:photo].index(photo.id.to_s)
      photo.save
    end
    render :nothing => true
  end
end
