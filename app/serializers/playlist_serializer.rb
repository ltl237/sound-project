class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :classifications
  # has_many :albums
end
