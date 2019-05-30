class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist
  has_many :classifications
  has_many :playlists
end
