class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :album_image
end
