require 'spec_helper'

describe "shared/_feed_item.html.haml" do
  
  it "should infer the controller path" do
    controller.request.path_parameters["controller"].should eq('shared')
  end
 
  it "should render head, title and body tags" do
    render :template => "layouts/application.html.haml"
    rendered.should have_selector "head"
    rendered.should have_selector "title"
    rendered.should have_selector "body"
  end
end