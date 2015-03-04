require 'spec_helper'

describe "pages/contact", type: :view do
  it "should infer the controller path" do
    controller.request.path_parameters[:controller].should eq('pages')
  end
 
  it "should infer the controller action" do
    controller.request.path_parameters[:action].should eq('contact')
  end
 
  it "should render head, title and body tags" do
    render :template => "layouts/application"
    rendered.should have_selector "head"
    rendered.should have_selector "title"
    rendered.should have_selector "body"
  end
end
