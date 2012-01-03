require 'spec_helper'

describe 'statuses/_form.html.haml' do

	before(:each) do
    @status = assign(:status, stub_model(Status,
      :state => 1,
      :user_id => 1
    ))
    render
  end

	it "should render head, title, body and container tags" do
		rendered.should have_selector "div", :class => 'field'
		rendered.should have_selector "div", :class => 'actions'
	end

	it "displays all the statuses" do
    assign(:statuses, [
      	stub_model(Status, :name => "Busy"),
      	stub_model(Status, :name => "Maybe"),
      	stub_model(Status, :name => "Open"),
    	])
    render
    rendered.should =~ /Busy/
    rendered.should =~ /Maybe/
    rendered.should =~ /Open/
	end
end