require 'nokogiri'
require 'open-uri'
 
class Service < ApplicationRecord
	# this imports data from NETFLIX_CODES.rb app/lib/assets/netflix_codes.rb
	def self.import_netflix_codes
		genres = JSON.parse(File.read(Rails.root.join('lib', 'assets', 'netflix_codes.rb')))
		self.import_genres(genres)
	end
  
	# this scrapes netflix with the given genre 'code', but so far I can't get movie IDs 
	def self.scrape(code)
		file = 'http://netflix.com/browse/genre/' + code.to_s + '?so=su'
    page = HTTParty.get(file)
		parse = Nokogiri::HTML(page)
	end
  
	def self.import_genres(genres)
		genres.each do |k,v|
			g = Genre.find_or_create_by(title: k, code: v)
			g.save
		end
	end
end
 