require 'spec_helper'

describe ApplicationController do
  # This is currently a dumb test moved over from the application template
  # view test. RSpec 3 does not support render_template in views, so the
  # test is moved here. Would be nice to remember what we were trying to
  # test for when we wrote the test the first time.
  it 'should render header, footer and stylesheets partials' do
    render_template partial: '_header'
    render_template partial: :footer
  end
end

