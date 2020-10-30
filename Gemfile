source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.0'
gem 'nokogiri', '>=1.5.9'
gem 'httparty'

group :development do
	gem 'capistrano-rails'
	gem 'capistrano-bundler'
	gem 'capistrano-passenger'
	gem 'capistrano', '~> 3.7.2'
	gem 'capistrano-rvm'
end

group :development, :test do
	gem 'foreman', '~> 0.82.0'
	gem 'listen'
	gem 'pry'
end
 
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
