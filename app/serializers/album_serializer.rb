class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :albumImg
  has_many :classifications
  has_many :playlists
end
