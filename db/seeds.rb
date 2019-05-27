# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'
require 'pry'

Classification.destroy_all
Playlist.destroy_all
Album.destroy_all

def get_json_response(artist_name)

	response_string = RestClient.get("http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=#{artist_name}&api_key=56db8dc89ddf7721c47c718da7786420&format=json&limit=2")
	response_hash = JSON.parse(response_string)
	
	puts response_hash
	response_hash["topalbums"]["album"].each do |album|
		Album.create(title: album["name"], artist: album["artist"]["name"])
	end
	
	# binding.pry
end

get_json_response("redhotchilipeppers")


divide = Album.create(title: "Divide", artist: "Ed Sheeran")
multiple = Album.create(title: "Multiply", artist: "Ed Sheeran")
plus = Album.create(title: "Plus", artist: "Ed Sheeran")
four = Album.create(title: "4 Your Eyez Only", artist: "J. Cole")
forest = Album.create(title: "Forest Hills Drive", artist: "J. Cole")

allEd = Playlist.create(title: "All About Ed")
jCole = Playlist.create(title: "J. Cole All Day")
rhcp = Playlist.create(title: "RHCP")



Classification.create(album_id: divide.id, playlist_id: allEd.id)
Classification.create(album_id: multiple.id, playlist_id: allEd.id)
Classification.create(album_id: plus.id, playlist_id: allEd.id)

Classification.create(album_id: four.id, playlist_id: jCole.id)
Classification.create(album_id: forest.id, playlist_id: jCole.id)





