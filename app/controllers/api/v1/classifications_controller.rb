class Api::V1::ClassificationsController < ApplicationController
	before_action :get_classification, only: [:show, :edit, :update]
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

	def update

		@classification.update(classParams)
		@classification.save
		# byebug
		render json: @classification
	end

	private
	def get_classification
		@classification = Classification.find(params[:id])
	end

	def classParams
		params.permit(:playlist_id, :album_id, :votes)
	end
end
