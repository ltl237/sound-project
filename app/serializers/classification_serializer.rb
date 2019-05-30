class ClassificationSerializer < ActiveModel::Serializer
  attributes :id, :votes
  belongs_to :playlist
  belongs_to :album
end
