# frozen_string_literal: true
require 'spec_helper'

describe 'layouts/statuses' do # , type: :feature do
  xit 'should render head, title, body and container tags' do
    visit '/statuses'

    expect(page.body).to have_css 'nav'
    expect(page.body).to have_css 'body'
    # This doesn't work because there are no statuses yet.
    # expect(page.body).to have_css "container"
  end
end
