require 'spec_helper'

describe "statuses/show.html.haml" do

  before(:each) do
    @status = assign(:status, stub_model(Status,
      :state => 1,
      :user_id => 1
    ))
    render
  end

  it "should display all statuses" do
    rendered.should =~ /State/
    rendered.should =~ /1/
  end

  it "should render tags" do
    rendered.should have_selector "p"
    rendered.should have_selector "b"
    rendered.should have_selector "span", :id => "busy"
    rendered.should have_selector "span", :id => "maybe"
    rendered.should have_selector "span", :id => "open"
    rendered.should have_selector "span", :id => "busy1"
    rendered.should have_selector "span", :id => "busy2"
  end
end