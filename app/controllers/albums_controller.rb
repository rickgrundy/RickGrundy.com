class AlbumsController < ApplicationController  
  before_filter :authenticate_user!, :except => [:index, :show, :show_by_name]
  
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
	
	def update
    Album.find(params[:id]).update_attributes!(params[:field] => params[:value])
	  render :text => params[:value]
	end
end
