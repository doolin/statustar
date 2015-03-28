require 'spec_helper'

describe "shared/_feed" do
  it "should infer the controller path" do
    controller.request.path_parameters[:controller].should eq('shared')
  end
end
