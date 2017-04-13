# frozen_string_literal: true

require 'spec_helper'

describe 'statuses/new.html.haml' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('statuses')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('new')
  end
end
