require 'spec_helper'

describe 'statuses/hello.html.haml' do

	before do
		render
	end

	it "should render head, title, body and container tags" do
		rendered.should have_selector "head"
		rendered.should have_selector "title"
		rendered.should have_selector "body"
	end
end