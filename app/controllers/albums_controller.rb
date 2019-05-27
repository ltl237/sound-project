class AlbumsController < ApplicationController

	def index
		@albums = Album.all
		render json: @albums
	end

	def show
		@album = Album.find(params[:id])
	end

	
end
