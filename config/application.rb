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
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.encoding = 'utf-8'
    config.filter_parameters += [:password]
  end
end
