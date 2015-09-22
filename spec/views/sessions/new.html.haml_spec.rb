require 'spec_helper'

describe "sessions/new" do
  it "should infer the controller path" do
    controller.request.path_parameters[:controller].should eq('sessions')
  end

  it "should infer the controller action" do
    controller.request.path_parameters[:action].should eq('new')
  end
end
