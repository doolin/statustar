# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'pages/home' do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('pages')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('home')
  end
end
