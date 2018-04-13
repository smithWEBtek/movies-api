require 'nokogiri'
require 'open-uri'
 
class Service < ApplicationRecord

	def self.scrape
		file = 'https://www.finder.com/netflix/genre-list'
		@genres = {}
    page = HTTParty.get(file)
		parse = Nokogiri::HTML(page)
		parse.css('div.nfx-genres').css('li').each do |genre|
			code = genre.css('a').entries[0].values[1].split('/').last.to_i
			name = genre.children.children.text
			@genres[name] = code
		end
		@genres.sort_by{:name}
		self.import_genres
	end

	def self.import_genres
		@genres.each do |k,v|
			g = Genre.find_or_create_by(name: k, code: v)
			g.save
		end
	end
end
 