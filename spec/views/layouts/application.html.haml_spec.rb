require 'spec_helper'

# Why all these "obvious" framework tests?
# TTD.
# Write the test, write the code to pass the test.
# This test is likely from the initial Rails tutorial.

describe 'layouts/application' do
  before do
    render
  end

  it "should render head, title, body and container tags" do
    rendered.should match /head/
    rendered.should match /title/
    rendered.should match /body/
    # rendered.should have_selector "div", :class => 'container'
  end

  it "should render javascript" do
    rendered.should match /script/
  end
end
