source 'https://rubygems.org'

ruby "2.1.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# login support
gem 'devise', '~> 3.2.0'
gem 'devise_google_authenticator', '~> 0.3.7'

# angular and bootstrap
gem 'angularjs_scaffold'

# leaflet support
gem "angular-leaflet-rails"

# tagging
gem 'acts-as-taggable-on'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
 
  # Rails 12factor
  # Makes running your Rails app easier. Based on the ideas behind 12factor.net
  # Needed for support of Asset Pipeline with Heroku
  # https://github.com/heroku/rails_12factor
  gem 'rails_12factor'
 
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end
