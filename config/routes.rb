Rails.application.routes.draw do
	
	root 'api/genres#index'  
	get '/', to: 'api/genres#index'
	namespace :api do
		resources :genres
		resources :movies
	end
end