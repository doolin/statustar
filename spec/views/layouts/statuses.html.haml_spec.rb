require 'spec_helper'

describe 'layouts/statuses', type: :view do
it "should render head, title, body and container tags", type: :view do
render
rendered.should have_selector "head"
rendered.should have_selector "title"
rendered.should have_selector "body"
end
	
it "displays all the statuses", type: :view do
assign(:statuses, [
double(Status, :name => "busy"),
double(Status, :name => "maybe"),
double(Status, :name => "open"),
])
render
rendered.should =~ /busy/
rendered.should =~ /maybe/
rendered.should =~ /open/
end

it "should render nav and style tags", type: :view do
render
rendered.should have_selector "nav"
rendered.should have_selector "style"
end
end
