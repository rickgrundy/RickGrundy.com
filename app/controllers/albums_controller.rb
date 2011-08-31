class AlbumsController < ApplicationController  
  before_filter :authenticate_user!, :except => [:index, :show, :show_by_name]
  
	def index
	  @albums = Album.where(hidden: false).order(:position)
	  @hidden_albums = Album.where(hidden: true) if user_signed_in?
	end
	
	def show
	  @album = Album.find(params[:id])
	  @page_title = "#{@album.name} | Rick Grundy"
	end	 
	
	def show_by_name
		@album = Album.find_by_name(params[:name])
		@page_title = "#{@album.name} | Rick Grundy" if @album
		render :action => 'show' if @album
    @missing_name = params[:name]
	end
	
	def update
    Album.find(params[:id]).update_attributes!(params[:field] => params[:value])
	  render :text => params[:value]
	end
	
	def sort
    Album.all.each do |album|
      album.position = params[:album].index(album.id.to_s)
      album.save
    end
    render :nothing => true
  end
  
  def new
    @album = Album.new
  end
  
  def create
    @album = Album.create!(params[:album].merge(:hidden => true))
    redirect_to @album.path
  end
  
  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_path
  end
end
