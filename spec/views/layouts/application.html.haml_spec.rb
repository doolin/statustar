require 'spec_helper'

describe 'layouts/application.html.haml' do

	before do
		render
	end

	it "should render head, title, body and container tags" do
		rendered.should have_selector "head"
		rendered.should have_selector "title"
		rendered.should have_selector "body"
		rendered.should have_selector "div",
			:class => 'container'
	end
	
	it "should render header and footer partials" do
		view.should render_template :partial => "_header"
		view.should render_template :partial => "_footer"
	end
end