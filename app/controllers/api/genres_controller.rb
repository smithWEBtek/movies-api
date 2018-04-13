class Api::GenresController < ApplicationController

	def index 
		@genres = Genre.all 
		
		render json: @genres
		render html:
			redirect_to 'genres/index'
	 
	end
	
end
