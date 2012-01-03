require 'spec_helper'

describe 'layouts/statuses.html.haml' do

	
	it "should render head, title, body and container tags" do
		render
		rendered.should have_selector "head"
		rendered.should have_selector "title"
		rendered.should have_selector "body"
	end
	
	it "displays all the statuses" do
	    assign(:statuses, [
	      	stub_model(Status, :name => "busy"),
	      	stub_model(Status, :name => "maybe"),
	      	stub_model(Status, :name => "open"),
	    	])
	    render
	    rendered.should =~ /busy/
	    rendered.should =~ /maybe/
	    rendered.should =~ /open/
  	end

  it "should render nav and style tags" do
		render
		rendered.should have_selector "nav"
		rendered.should have_selector "style"
	end
end