class Genre < ApplicationRecord
	has_many :movie_genres
	has_many :movies, through: :movie_genres

	def create_url
		self.url = 'http://netflix.com/browse/genre/' + self.code.to_s
		self.save
	end
end
