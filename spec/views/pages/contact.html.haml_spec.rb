# frozen_string_literal: true
require 'spec_helper'

describe 'pages/contact', type: :view do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('pages')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('contact')
  end
end
