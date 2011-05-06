class AlbumsController < ApplicationController  
	def index
	  @albums = Album.find(:all, :order => :position).reject{|a| a.hidden}
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
end
