source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

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
gem 'jbuilder', '~> 1.0.1'

# DB
gem "pg", "~> 0.17.0"

gem "nas-yahoo_stock", "~> 1.0.8"

# Jobs
gem "sidekiq", "~> 2.14.1"

# For sidekiq CP
gem "sinatra", "~> 1.4.3", require: false
gem "slim", "~> 2.0.1"

gem "foreman", "~> 0.63.0"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
 	gem "better_errors", "~> 1.0.1"
 	# For debugging with PRY
 	gem "binding_of_caller", "~> 0.7.2"
	gem "pry", "~> 0.9.12.2"
	gem "pry-nav", "~> 0.2.3"
	# For Seed Data
	gem "seed_dump", "~> 2.0.0" # rake db:seed:dump WITH_ID=true
	gem "populator", "~> 1.0.0" # rake db:populate
	gem "faker", "~> 1.2.0"
	# Hide Assets
	gem "quiet_assets", "~> 1.0.2"
end

group :development, :test do
	gem "rspec-rails", "~> 2.14.0"
	gem "factory_girl_rails", "~> 4.3.0"
end

group :test do	
	gem "database_cleaner", "~> 1.2.0"
	gem "vcr", "~> 2.8.0"
	gem "webmock", "~> 1.16.0"
	gem "faker", "~> 1.2.0"
	gem "capybara", "~> 2.2.0" 
	gem "guard-rspec", "~> 4.0.4"
	gem "rspec-sidekiq", "~> 0.5.1"
end



# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
