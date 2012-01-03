source 'http://rubygems.org'

gem 'rails', '3.0.10'
gem 'will_paginate'
gem 'gravatar_image_tag', '1.0.0'
gem 'thin'
gem 'haml'
gem 'sass'
gem 'rb-fsevent'

# Fix Rack/Capybara/whatever UTF encoding crapola:
# gem 'rack', '1.3'
gem 'escape_utils'

# Need to move to pg for everything:
# http://devcenter.heroku.com/articles/rails3
group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

group :development do
  gem 'cucumber-rails'
  gem 'database_cleaner'
	gem 'faker', '0.3.1'
	gem 'launchy'
end

group :test do
  gem 'simplecov'
  gem 'cucumber-rails'
  gem 'database_cleaner'
	gem 'rspec-rails', '2.6.0'
	gem 'webrat', '0.7.1'
	gem 'factory_girl_rails', '1.0'
end
