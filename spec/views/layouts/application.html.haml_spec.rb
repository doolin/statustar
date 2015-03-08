require 'spec_helper'

describe 'layouts/application' do
  before do
    render
  end

  it "should render head, title, body and container tags" do
    rendered.should have_selector "head"
    rendered.should have_selector "title"
    rendered.should have_selector "body"
    rendered.should have_selector "div", :class => 'container'
  end

  # `render_template` is available in controller and request specs now,
  # no longer available in view specs. A better way to write this test
  # is to figure out what we're looking for, and test for that.
  # Otherwise this is more or less a framework test, and not a smart one.
  xit "should render header, footer and stylesheets partials" do
    view.should render_template :partial => "_header"
    view.should render_template :partial => :footer
  end

  it "should render javascript" do
    rendered.should have_selector "script"
  end
end
