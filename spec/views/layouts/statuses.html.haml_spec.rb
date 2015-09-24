require 'spec_helper'

describe 'layouts/statuses' do
  it "displays all the statuses" do
    assign(:statuses, [
      double(Status, name: "busy"),
      double(Status, name: "maybe"),
      double(Status, name: "open"),
    ])
    render
    rendered.should =~ /busy/
    rendered.should =~ /maybe/
    rendered.should =~ /open/
  end
end
