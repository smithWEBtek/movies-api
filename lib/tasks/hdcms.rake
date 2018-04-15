namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app swt-movies --confirm swt-movies
      heroku run rake db:migrate --app swt-movies
      heroku run rake db:seed --app swt-movies')	
  end
end