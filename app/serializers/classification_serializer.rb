class ClassificationSerializer < ActiveModel::Serializer
  attributes :id, :votes
  has_one :playlist
  has_one :album
end
