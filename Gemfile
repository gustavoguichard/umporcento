source 'https://rubygems.org'
ruby '2.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use PostgreSQL as the database for Active Record
gem 'pg'

# Frontend stuff
gem 'uglifier'
gem 'coffee-rails'
gem 'slim'
gem 'slim-rails'
gem 'browser' # To detect browser version
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'autoprefixer-rails'
gem 'compass-rails'
gem 'semantic-mixins', '~> 0.2.3.1'

gem 'initjs'

gem 'google-analytics-rails'

# Server
gem 'unicorn'

group :production do
  gem 'heroku-deflater', '~> 0.4.1'
  gem 'rails_12factor'
end

group :development do
  gem 'annotate', github: 'ctran/annotate_models', branch: 'develop'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  #use profiler gem only when profiling the app
  #gem 'rack-mini-profiler'
end