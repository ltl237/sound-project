class Album < ApplicationRecord
	has_many :classifications
	has_many :playlists, through: :classifications
end
