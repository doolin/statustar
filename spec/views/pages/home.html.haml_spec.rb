require 'spec_helper'

describe 'pages/home' do
  it 'should infer the controller path' do
    controller.request.path_parameters[:controller].should eq('pages')
  end

  it 'should infer the controller action' do
    controller.request.path_parameters[:action].should eq('home')
  end
end
