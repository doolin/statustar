# frozen_string_literal: true
require 'spec_helper'

# Why all these "obvious" framework tests?
# TTD.
# Write the test, write the code to pass the test.
# This test is likely from the initial Rails tutorial.

describe 'layouts/application' do
  before do
    render
  end

  it 'should render head, title, body and container tags' do
    expect(rendered).to match(/head/)
    expect(rendered).to match(/title/)
    expect(rendered).to match(/body/)
  end

  it 'should render javascript' do
    expect(rendered).to match(/script/)
  end
end
