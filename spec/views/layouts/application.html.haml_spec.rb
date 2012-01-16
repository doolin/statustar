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
	
	it "should render header, footer and stylesheets partials" do
		view.should render_template :partial => "_header"
		view.should render_template :partial => "_footer"
	end

	it "should render javascript" do
		rendered.should have_selector "title", javascript_include_tag => :defaults
	end
end