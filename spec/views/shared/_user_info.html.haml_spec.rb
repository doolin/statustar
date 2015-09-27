require 'spec_helper'

describe 'shared/_user_info' do
  it 'should infer the controller path' do
    controller.request.path_parameters[:controller].should eq('shared')
  end
end
