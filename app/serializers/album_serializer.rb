class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :album_image
  has_many :classifications
  has_many :playlists
end
