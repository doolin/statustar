# frozen_string_literal: true

class ApiBaseController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery
  include SessionsHelper
end
