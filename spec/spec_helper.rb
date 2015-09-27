require 'rubygems'
require 'simplecov'
require 'awesome_print'

SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec

  config.expect_with :rspec do |c|
    c.syntax = [:expect, :should]
  end

  # config.raise_errors_for_deprecations!
  # config.warnings = false

  config.infer_spec_type_from_file_location!

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  def test_sign_in(user)
    controller.sign_in(user)
  end

  def integration_sign_in(user)
    visit signin_path
    if user
      fill_in :session_email,    with: user.email
      fill_in :session_password, with: user.password
    else
      fill_in :session_email,    with: ''
      fill_in :session_password, with: ''
    end
    click_button 'Sign in'
  end
end
