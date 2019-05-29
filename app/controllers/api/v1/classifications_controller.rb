class Api::V1::ClassificationsController < ApplicationController

	def index
		@classifications = Classification.all
		@playlists = []
		@playlistsAndAlbums = {}
		@classifications.each do |classification|
			@playlistsAndAlbums[classification.playlist] = classification.album
		end

		render json: @classifications
		# render json: @playlists

	end

	def show
		@classification = Classification.find(params[:id])
	end

	def create
		@classification = Classification.create(classParams)
		render json: @classification
	end

	private

	def classParams
		params.require(:classification).permit(:playlist_id, :album_id, :votes)
	end
end
