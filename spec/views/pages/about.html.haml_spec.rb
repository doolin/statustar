require 'spec_helper'

describe "pages/about" do
  it "infers the controller path" do
    controller.request.path_parameters[:controller].should eq('pages')
  end
 
  it "infers the controller action" do
    controller.request.path_parameters[:action].should eq('about')
  end
 
  it "renders head, title and body tags" do
    render :template => "layouts/application"
    rendered.should have_selector "head"
    rendered.should have_selector "title"
    rendered.should have_selector "body"
  end
end
