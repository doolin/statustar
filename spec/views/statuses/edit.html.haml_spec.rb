require 'spec_helper'

describe "statuses/edit.html.haml" do

	it "should render Show and Back text" do
    render :template => "layouts/application.html.haml"
    render :partial => "statuses/form.html.haml"
		rendered.should =~ /Busy/
    rendered.should =~ /Maybe/
    rendered.should =~ /Open/
	end
 
  it "should infer the controller path" do
    controller.request.path_parameters["controller"].should eq('statuses')
  end
 
  it "should infer the controller action" do
    controller.request.path_parameters["action"].should eq('edit')
  end
 
  it "should display edit statuses" do
    render :template => "layouts/application.html.haml"
    rendered.should =~ /Status/
  end
 
  it "should have correct <title> element " do
    render :template => "layouts/application.html.haml", 
      :layout => "layouts/application"
    rendered.should have_selector "title", 
      :content => "Statustar"
  end
end