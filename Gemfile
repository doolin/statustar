source 'http://rubygems.org'

gem 'rails', '4.2.4'
gem 'protected_attributes'

gem 'will_paginate'
gem 'gravatar_image_tag', '1.0.0'
gem 'thin'
gem 'haml-rails'
gem 'sass'
gem 'zurb-foundation', :group => :assets

gem 'awesome_print'
gem 'rubocop'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# Fix Rack/Capybara/whatever UTF encoding crapola:
# gem 'rack', '1.3'
gem 'escape_utils'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'pry-nav'
end

gem 'launchy'

group :test do
  # gem 'minitest' # get rid of this on rspec 3.x
  gem 'faker'
  gem 'simplecov'
  gem 'cucumber-rails', require: false # for "WARNING: Cucumber-rails required outside of env.rb"
  gem 'database_cleaner'
  gem 'rspec-rails', '3.3'
  gem 'capybara'
  gem 'webrat', '0.7.1'
  gem 'factory_girl_rails' # , '4.5.0'
  gem 'jasmine', :git => "git://github.com/pivotal/jasmine-gem.git"
end
