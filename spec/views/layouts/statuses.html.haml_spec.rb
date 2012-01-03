require 'spec_helper'

describe 'layouts/statuses.html.haml' do

	before do
		render
	end

	it "should render head, title, body and container tags" do
		rendered.should have_selector "head"
		rendered.should have_selector "title"
		rendered.should have_selector "body"
	end
	
	it "displays all the statuses" do
    assign(:statuses, [
      	stub_model(Status, :name => "busy"),
    	])

    render

    rendered.should =~ /busy/
  end
end