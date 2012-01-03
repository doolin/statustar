source 'http://rubygems.org'

gem 'rails', '3.0.10'
gem 'sqlite3-ruby', '1.3.3' 		 
gem 'will_paginate'
gem 'gravatar_image_tag', '1.0.0'

gem 'haml'
gem 'sass'
gem 'rb-fsevent'

# Fix Rack/Capybara/whatever UTF encoding crapola:
# gem 'rack', '1.3'
gem 'escape_utils'

group :development do
  gem 'cucumber-rails'
  gem 'database_cleaner'
#	gem 'annotate-models', '1.0.4'
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

group :production do
  gem 'postgres-pr'
end
