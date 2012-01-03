require 'spec_helper'

describe "statuses/edit.html.haml" do

	xit "should render Show and Back text" do
    render :template => "layouts/application"
    render :partial => "statuses/form.html.haml"
		rendered.should =~ /Show/
	end
end