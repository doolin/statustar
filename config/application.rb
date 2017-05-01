# frozen_string_literal: true

require File.expand_path('../boot', __FILE__)

require 'rails/all'

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
