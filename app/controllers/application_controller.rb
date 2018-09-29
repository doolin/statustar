# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_action :authenticate_user!
  # include SessionsHelper
end
