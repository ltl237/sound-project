class Api::V1::AlbumsController < ApplicationController
	def index
		@albums = Album.all
		render json: @albums
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
		@album = Album.new
	end

	def create
		# @album = Album.create(albumParams)
		# byebug
		@album = Album.find_or_create_by(albumParams)
		# find_or_create_by(:title)
		render json: @album
	end

	private

	def albumParams
		params.require(:album).permit(:title, :artist, :albumImg)
	end
end
