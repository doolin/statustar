require 'spec_helper'

describe "statuses/new.html.haml" do

  it "should infer the controller path" do
    controller.request.path_parameters[:controller].should eq('statuses')
  end
 
  it "should infer the controller action" do
    controller.request.path_parameters[:action].should eq('new')
  end
end
