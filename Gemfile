# frozen_string_literal: true

source 'http://rubygems.org'

gem 'rails', '5.1.2'
gem 'rails-controller-testing'

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
# TODO: get rid of escape_utils if possible
gem 'escape_utils'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'listen'
end

gem 'launchy'

group :test do
  gem 'faker'
  gem 'simplecov'
  # TODO: generate updated cucumber configuration files.
  gem 'cucumber-rails', require: false # "WARNING: Cucumber-rails required outside of env.rb"
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'jasmine' # , git: 'git://github.com/pivotal/jasmine-gem.git'
end
