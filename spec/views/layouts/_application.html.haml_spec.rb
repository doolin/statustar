require 'spec_helper'

describe 'layouts/_application.html.haml' do

	before do
		render
	end

	it "should render head and body" do
		rendered.should have_selector 'title',
			:id => 'title'
		end
	end
end