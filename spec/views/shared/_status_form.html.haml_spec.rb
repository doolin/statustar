# frozen_string_literal: true

require 'spec_helper'

describe 'shared/_status_form' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('shared')
  end
end
