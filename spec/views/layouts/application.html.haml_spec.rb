# frozen_string_literal: true

require 'spec_helper'

# Why all these "obvious" framework tests?
# TTD.
# Write the test, write the code to pass the test.
# This test is likely from the initial Rails tutorial.

describe 'layouts/application' do
  before do
    allow(view).to receive(:title).and_return('Blah')
    allow(view).to receive(:signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(create(:user))
    allow(view).to receive(:logo).and_return('logo')
    render
  end

  it 'renders head, title, body and container tags' do
    expect(rendered).to match(/head/)
    expect(rendered).to match(/title/)
    expect(rendered).to match(/body/)
  end

  it 'renders javascript' do
    expect(rendered).to match(/script/)
  end
end
