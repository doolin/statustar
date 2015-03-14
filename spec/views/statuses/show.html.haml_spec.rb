require 'spec_helper'

describe "statuses/show" do
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

  xit "displays all the statuses" do
    assign(:statuses, [
        double(Status, :name => "Busy"),
        double(Status, :name => "Maybe"),
        double(Status, :name => "Open"),
      ])
    #render
    rendered.should =~ /Busy/
    rendered.should =~ /Maybe/
    rendered.should =~ /Open/
  end
end
