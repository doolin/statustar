require 'spec_helper'

describe "pages/about.html.haml" do

  it "should infer the controller path" do
    controller.request.path_parameters["controller"].should eq('pages')
  end
 
  it "should infer the controller action" do
    controller.request.path_parameters["action"].should eq('about')
  end
 
  it "should render head, title and body tags" do
    render :template => "layouts/application.html.haml"
    rendered.should have_selector "head"
    rendered.should have_selector "title"
    rendered.should have_selector "body"
  end
end