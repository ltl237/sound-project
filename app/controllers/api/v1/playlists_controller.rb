class Api::V1::PlaylistsController < ApplicationController

	def index
		@playlists = Playlist.all
		@classifications = Classification.all
		@playlistsAndAlbums = {}

		@playlists.map do |playlist|
			# @playlistsAndAlbums[playlist.id] = {}
			@playlistsAndAlbums[playlist.title] = {playlistTitle: playlist.title, playlistID: playlist.id, albums: [playlist.albums]}
			
		end
	
		render json: @playlistsAndAlbums
	end

	def show
		@playlist = Playlist.find(params[:id])
		render json: @playlist
	end
end
