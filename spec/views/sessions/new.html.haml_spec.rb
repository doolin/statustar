# frozen_string_literal: true
require 'spec_helper'

RSpec.describe 'sessions/new' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('sessions')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end
end
