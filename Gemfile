# frozen_string_literal: true
source 'http://rubygems.org'

gem 'rails', '5.0.2'
gem 'rails-controller-testing'
# gem 'protected_attributes'

gem 'will_paginate'
gem 'gravatar_image_tag'
gem 'thin'
gem 'haml-rails'
gem 'sass'
gem 'zurb-foundation', group: :assets

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
  gem 'rspec-rails'
  gem 'capybara'
  gem 'webrat'
  gem 'factory_girl_rails'
  gem 'jasmine', git: 'git://github.com/pivotal/jasmine-gem.git'
end
