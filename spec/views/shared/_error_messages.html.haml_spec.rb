# frozen_string_literal: true

require 'spec_helper'

describe 'shared/_error_messages' do
  before do
    stub_template 'shared/_error_message' => 'error message template'
  end

  it 'should infer the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('shared')
  end
end
