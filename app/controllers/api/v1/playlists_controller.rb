class Api::V1::PlaylistsController < ApplicationController

	def index
		@playlists = Playlist.all
		@classifications = Classification.all
		@playlistsAndAlbums = {}

		# @playlists.map do |playlist|
			# @playlistsAndAlbums[playlist.id] = {}
			# @playlistsAndAlbums[playlist.title] = {playlistID: playlist.id, playlistTitle: playlist.title, albums: playlist.albums}

		# end

		render json: @playlists
	end

	def show
		@playlist = Playlist.find(params[:id])
		render json: @playlist
	end


	def create
		@playlist = Playlist.create(playlistParams)
		render json: @playlist
	end

	private

	def playlistParams
		params.require(:playlist).permit(:title)
	end
end
