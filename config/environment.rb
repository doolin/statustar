# Load the Rails application.
require_relative 'application'

# Upcoming deprecation in Rails 5.2
Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
# Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = false

# Initialize the Rails application.
Rails.application.initialize!
