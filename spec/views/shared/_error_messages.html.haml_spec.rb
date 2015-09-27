require 'spec_helper'

describe 'shared/_error_messages' do
  before do
    stub_template 'shared/_error_message' => 'error message template'
  end

  it 'should infer the controller path' do
    controller.request.path_parameters[:controller].should eq('shared')
  end
end
