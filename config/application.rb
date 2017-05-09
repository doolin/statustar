# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

if defined?(Bundler)
  Bundler.require(:default, :assets, Rails.env)
end

module Statustar
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.assets.enabled = true
    config.assets.version = '1.0'
    config.encoding = 'utf-8'

    # TODO: remove if possible
    # config.filter_parameters += [:password]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
