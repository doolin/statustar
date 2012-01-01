source 'http://rubygems.org'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'mysql2'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

gem 'rails', '3.0.10'
gem 'sqlite3-ruby', '1.3.3' 		 
gem 'will_paginate'
gem 'gravatar_image_tag', '1.0.0'

gem 'haml'
gem 'sass'
gem 'rb-fsevent'

# Fix Rack/Capybara/whatever UTF encoding crapola:
#gem 'rack', '1.3'
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
#	gem 'autotest', '4.4.6'
#	gem 'autotest-rails-pure', '4.1.2' 
    # gem 'autotest-fsevent', '0.2.4'
#	gem 'autotest-growl', '0.2.9'
	gem 'rspec-rails', '2.6.0'
#	gem 'spork', '0.8.4'
	gem 'webrat', '0.7.1'
	gem 'factory_girl_rails', '1.0'
#	gem 'metric_fu', '2.0.1'
end

group :production do
  gem 'postgres-pr'
end
