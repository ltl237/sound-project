class Api::V1::ClassificationsController < ApplicationController
	def index

		@classifications = Classification.all
		@playlists = []
		@playlistsAndAlbums = {}
		# byebug
		@classifications.each do |classification|
			@playlistsAndAlbums[classification.playlist] = classification.album
		end

		render json: @classifications
		# render json: @playlists

	end


	def show
		@classification = Classification.find(params[:id])
	end
end
