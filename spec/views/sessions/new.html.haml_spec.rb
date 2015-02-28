require 'spec_helper'

describe "sessions/new" do
  it "should infer the controller path" do
    controller.request.path_parameters["controller"].should eq('sessions')
  end
 
  it "should infer the controller action" do
    controller.request.path_parameters["action"].should eq('new')
  end
 
  it "should render head, title and body tags" do
    render :template => "layouts/application"
    rendered.should have_selector "head"
    rendered.should have_selector "title"
    rendered.should have_selector "body"
  end
end
