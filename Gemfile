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
gem 'will_paginate'
gem 'gravatar_image_tag', '1.0.0'
gem 'thin'
gem 'haml-rails'
gem 'sass'
gem 'rb-fsevent'

# Fix Rack/Capybara/whatever UTF encoding crapola:
#gem 'rack', '1.3'
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
