class Playlist < ApplicationRecord
	has_many :classifications
	has_many :albums, through: :classifications
end
