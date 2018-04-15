require 'nokogiri'
require 'open-uri'
 
class Service < ApplicationRecord
	# this imports data from NETFLIX_CODES.rb app/lib/assets/netflix_codes.rb
	def self.import_netflix_codes
		genres = JSON.parse(File.read(Rails.root.join('lib', 'assets', 'netflix_codes.rb')))
		self.import_genres(genres)
	end
  
	# this scrapes a site for about 23,000 genre codes, but they don't work as expected
	def self.scrape
		file = 'https://www.finder.com/netflix/genre-list'
		genres = {}
    page = HTTParty.get(file)
		parse = Nokogiri::HTML(page)
		parse.css('div.nfx-genres').css('li').each do |genre|
			code = genre.css('a').entries[0].values[1].split('/').last.to_i
			name = genre.children.children.text
			genres[name] = code
		end
		genres.sort_by{:name}
		self.import_genres(genres)
	end

	def self.import_genres(genres)
		genres.each do |k,v|
			g = Genre.find_or_create_by(title: k, code: v)
			g.save
		end
	end
end
 