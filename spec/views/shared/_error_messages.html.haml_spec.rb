require 'spec_helper'

describe "shared/_error_messages.html.haml" do
  before do
    stub_template "shared/_error_message.html.haml" => "error message template"
  end
  
  # Rendering layout does not include sidebar.
  xit "renders the sidebar" do
    render :template => "layouts/application.html.haml"
    rendered.should contain "error message template"
  end

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