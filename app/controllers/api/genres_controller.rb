class Api::GenresController < ApplicationController
	include ActionController::MimeResponds

	def index 
		@genres = Genre.all 
		render json: @genres


		# render '/api/genres/index'
		# respond_to do |format|
    #   format.html { render :index }
    #   format.json { render json: @genres }
    # end
	end
end
