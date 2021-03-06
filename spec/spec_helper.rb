# frozen_string_literal: true

require 'rubygems'
require 'awesome_print'

require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

require 'capybara/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  # TODO: remove once updated to RSpec 3+
  # config.expect_with :rspec do |c|
  #   c.syntax = [:expect, :should]
  # end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.include FactoryBot::Syntax::Methods

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
