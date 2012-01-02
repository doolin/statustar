require 'spec_helper'

describe 'layouts/_application.html.haml' do

	before do
		render
	end

	it "should render head and body" do
		rendered.should have_selector 'div',
			:class => 'container'
	end
	
	xit "should render title" do 
		rendered.should have_tag "title", 
			:id => title
	end

	it "should render header and footer partials" do
		view.should render_template :partial => "_header"
		view.should render_template :partial => "_footer"
	end
end